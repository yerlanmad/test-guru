class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  
  def show

  end

  def result
    @correct_questions = @test_passage.correct_questions
    @rate = @correct_questions / @test_passage.test.questions.count.to_f * 100
    
    if @rate < 85
      @style = 'color:red'
      @message = "You didn't pass the test"
    else
      @style = 'color:green'
      @message = 'Test was passed successfully'
    end
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
  
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
