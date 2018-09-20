class Api::V1::QuestionsController < ApplicationController
skip_before_action :verify_authentication, only: [:index, :show]
before_action :set_question, only: [:show, :destroy]
skip_before_action :verify_authenticity_token, except: [:update, :destroy]

  def index
    @questions = Question.all
  end

  def create
    @question = Question.new(title: question_params[:title], body: question_params[:body], user_id: api_token_user.id)
    if @question.save
        render :show, status: :created, location: api_v1_question_url(@question)
       
    else
        render json: { "error": "Unable to create question, yo!" }, status: :unprocessable_entity 
    end
  end
    
 private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end

