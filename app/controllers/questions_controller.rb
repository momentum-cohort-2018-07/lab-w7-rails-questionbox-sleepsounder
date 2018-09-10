class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(question_params)
  end

  def new
    @question = Question.new
  end

  def create
  end

  def destroy
  end


  private 

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end



end
