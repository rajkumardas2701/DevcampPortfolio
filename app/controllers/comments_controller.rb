class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @comment = current_user.comments.build(comment_params)
    # byebug

    # if @comment.save
    #   # format.html { render blog }
    #     ActionCable.server.broadcast 'blogs_channel',
    #                                 content: @comment.content
    #     # ActionCable.server.broadcast "blogs_channel",
    #     #                                 comment: render_comment(@comment)
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  # def render_comment(comment)
  #   CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  # end
end
