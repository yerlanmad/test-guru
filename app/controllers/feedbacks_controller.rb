class FeedbacksController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.with(user: current_user).feedback_email(feedback_params).deliver_later
    flash[:notice] = t('.feedback_sent')
    redirect_to user_root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :text)
  end
end
