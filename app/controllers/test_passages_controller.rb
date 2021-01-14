class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result]
  
  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def result
    redirect_to root_path unless @test_passage.user_id == current_user.id
  
    @rate = @test_passage.rate
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
