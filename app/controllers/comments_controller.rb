class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = current_user.comments.new(comment_params)
    @comment.question_id = params[:question_id]
    if @comment.save
      UserMailer.response_confirmation(current_user).deliver
      flash[:notice] = "Thanks for posting your comment!"
      redirect_to question_path(@comment.question_id)
    else
      flash[:alert] = "There was an error, try again please"
      redirect_to :back
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    @question.comments(:first_response => true).any?
    @question.comments.update_all(:first_response => false)
    @comment.update(:first_response => true)
    flash[:notice] = "Got it! Saving your favorite response now!"
    redirect_to question_path(@comment.question_id)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:alert] = "Comment destroyed!"
    redirect_to question_path(@question)
  end

private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end

end
