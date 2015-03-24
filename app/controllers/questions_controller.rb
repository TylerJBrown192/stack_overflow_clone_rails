class QuestionsController < ApplicationController
  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
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

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(params[:question])
      flash[:notice] = "Question successfully updated!"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:alert] = "Question successfully deleted!"
    end
    redirect_to user_path(current_user)
  end

private

  def question_params
    params.require(:question).permit(:question_title, :question_content)
  end

end
