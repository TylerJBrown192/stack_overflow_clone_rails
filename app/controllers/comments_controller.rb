class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:question_id])
    @comment = current_user.comments.new(comment_params)
    @comment.question_id = params[:question_id]
    if @comment.save
      UserMailer.response_confirmation(@user).deliver
      flash[:notice] = "Thanks for posting your comment!"
      redirect_to question_path(@comment.question_id)
    else
      flash[:alert] = "There was an error, try again please"
      redirect_to :back
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      flash[:notice] = "Comment successfully updated!"
      redirect_to question_path(@comment.question_id)
    else
      render :edit
    end
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
