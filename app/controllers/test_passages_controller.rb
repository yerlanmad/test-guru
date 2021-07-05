class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result]
  before_action :find_achievements, only: %i[update]

  
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
      TestsMailer.completed_test(@test_passage).deliver_later
      save_achievements
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def find_achievements
    @achievements = {}
    
    if @test_passage.is_passed? && @test_passage.attempts_count == 1
      @achievements['first_attempt'] = Badge.where(first_attempt: true)
    end

    if @test_passage.is_passed? && @test_passage.all_in_category?
      @achievements['all_in_category'] = Badge.where(all_in_category: true, category_id: @test_passage.test.category_id)
    end

    if @test_passage.is_passed? && @test_passage.all_in_level?
      @achievements['all_in_level'] = Badge.where(all_in_level: true, level: @test_passage.test.level)
    end
  end

  def save_achievements
    @achievements.each_value do |badges|
      badges.each do |badge|
        current_user.badges.push(badge)
      end
    end
  end
end
