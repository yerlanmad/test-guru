class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_badges, only: %i[index]
  before_action :find_badge, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index
  end

  def show
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def rescue_with_badge_not_found(exception)
    render plain: exception.message
  end
end
