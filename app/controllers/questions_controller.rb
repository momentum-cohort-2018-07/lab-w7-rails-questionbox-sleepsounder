class QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    if !!logged_in?
      @question = Question.new
    else redirect_to new_session_path, notice: 'You must be logged in to ask a question, yo.'
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else 
      render 'new'
    end
end

  def destroy
    @question = Question.delete
  end


  private 

  def question_params
    params.require(:question).permit(:title, :body, :user_id, :username, :answer_id)
  end



end
