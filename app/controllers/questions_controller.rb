class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(question_params)
  end

  def new
      puts 'sup questions new action!********************'
      
    if !!logged_in?
      @question = Question.new
    else redirect_to new_session_path, notice: 'You must be logged in to ask a question, yo.'
    end
  end

  def create
    @question = Question.new(question_params)
      puts @question.to_s + ' sup questions create action!***********************'
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
