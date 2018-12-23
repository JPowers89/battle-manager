class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      if @user.combats.first.nil?
        redirect_to new_combat_path
      else
        redirect_to @user.combats.first
      end
    else
      flash[:danger] = "Login has failed. Invalid email or password."
      redirect_to root_url
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
