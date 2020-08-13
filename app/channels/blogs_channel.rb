class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def unsubscribe; end

  def send_comment(data)
    # console.log(data.content)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end
