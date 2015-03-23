class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Thanks for asking! Please check back to see responces."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "There was an error, try again please."
      redirect_to :back
    end
  end

  def show
    @question = Question.find(params[:id])
  end

private

  def question_params
    params.require(:question).permit(:question_title, :question_content)
  end

end
