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
    params.permit(:title, :body, :user_id)
  end



end
