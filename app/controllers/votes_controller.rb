class VotesController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    Vote.create({:user_id => current_user.id, :comment_id => params[:comment_id]})
    flash[:notice] = "Best answer accepted!"
    redirect_to question_path(@question)
  end
end
