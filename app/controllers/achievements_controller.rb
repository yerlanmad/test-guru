class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_achievements, only: %i[index]

  def index
  end

  def create
  end

  private

  def find_achievements
    @achievements = current_user.achievements
  end
end
