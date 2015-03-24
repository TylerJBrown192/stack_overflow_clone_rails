class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.question_id = params[:question_id]
    if @comment.save
      # email for user responded to should go here
      flash[:notice] = "Thanks for posting your comment!"
      redirect_to question_path(@comment.question_id)
    else
      flash[:alert] = "There was an error, try again please"
      redirect_to :back
    end
  end

private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end

end
