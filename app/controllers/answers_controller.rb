class AnswersController < ApplicationController
  skip_before_action :verify_authentication
  before_action :set_answer, only: [:edit, :destroy]
  
  def new
    if current_user
      @answer = Answer.new
      @question = Question.find(params[:question_id])
    else
      flash[:notice] = "You Must be logged in to Answer"
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    if @answer.save
      UserMailer.answer_notify(@question.user.email).deliver_now
      puts 'create action********************************'
      redirect_to @question
     else
      flash[:notice] = "Failed to submit answer"
      render 'new'
     end
  end

  def show
  end

  def delete
  end

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end

  def set_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end
end
