class QuestionsController < ApplicationController
  before_action :find_test, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @questions = @test.questions
  end

  def show
    question = Question.find(params[:id])
    render plain: question.inspect
  end

  def new
    #
  end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    render inline: "<p>Question with id: <%= question.id %> was deleted"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_record_not_found
    render plain: "Question was not found" if params[:id]
    render plain: "Test was not found" if params[:test_id]
  end
end
