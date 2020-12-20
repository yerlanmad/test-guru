class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path] || root_path
    else
      flash.now[:alert] = flash_alert
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete :email
    cookies.delete :path
    render :new
  end
end
