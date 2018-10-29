import { Socket } from "phoenix"

let socket = new Socket("/socket", { params: { token: window.userToken } })


socket.connect()

const createSocket = (topic_id) => {
  let channel = socket.channel(`comments:${topic_id}`, {})
  channel.join()
    .receive("ok", resp => { 
      renderComments(resp.comments);
      console.log(resp)
    })
    .receive("error", resp => { 
      console.log("Unable to join", resp) 
    });

  channel.on(`comments:${topic_id}:new`, renderComment);

  document.querySelector('button').addEventListener('click', () => {
    const $textArea = document.querySelector('textarea');
    const content = $textArea.value.trim();

    channel.push('comment:add', { content: content });

    $textArea.value = '';
  })
}

function commentTemplate(comment) {
  let email = 'Anonymous';
  if (comment.user) {
    email = comment.user.email;
  }

  return `
  <li class="collection-item">
    ${comment.content}
    <div class="secondary-content">
      ${email}
    </div>
  </li>
  `
}

function renderComment(event) {
  const renderedComment = commentTemplate(event.comment);
  document.querySelector('.collection').innerHTML += renderedComment;
}

function renderComments(comments) {
  const renderedComments = comments.map(comment => {
    return commentTemplate(comment);
  });
  document.querySelector('.collection').innerHTML = renderedComments.join('');
}

window.createSocket = createSocket;