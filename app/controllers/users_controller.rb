class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully!"
      redirect_to root_url
    else
      respond_to do |format|
        format.js { render action: "register" }
      end
    end
  end
  def register
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
