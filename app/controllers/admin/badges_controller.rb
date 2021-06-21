class Admin::BadgesController < Admin::BaseController
  before_action :find_badges, only: %i[index]
  before_action :find_badge, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :icon, :category_id, :level, :first_attempt,
      :all_in_category,
      :all_in_level)
  end

  def rescue_with_badge_not_found(exception)
    render plain: exception.message
  end
end
