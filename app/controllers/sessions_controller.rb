# frozen_string_literal: true

# Manages Sessions created at log in
class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in @user
      route_after_login
    else
      flash[:danger] = 'Login has failed. Invalid email or password.'
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def route_after_login
    if @user.combats.first.nil?
      redirect_to new_combat_path
    else
      redirect_to @user.combats.first
    end
  end
end
