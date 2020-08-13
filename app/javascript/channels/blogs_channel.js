import consumer from "./consumer"

consumer.subscriptions.create("BlogsChannel", {
  connected() {
    console.log('Hey, we are live')
  },
  disconnected() {

  },
  received(data) {
    // console.log(data.content)
    $('comment_content').append(data.content)
    // '<div class="message"> ' + 
    // + '</div>'
  }
});

let submit_messages;
$(document).on('turbolinks:load', function () {
  submit_messages(comment, blog_id)
    // @perform 'submit_messages'
    // comment = comment
    // blog_id = blog_id
})
submit_messages = function () {
  $('#new_comment').on('keydown', function (event) {
    if (event.keyCode == 13) {
      $('input').click()
      event.target.value = ''
      event.preventDefault()
    }
  })
}