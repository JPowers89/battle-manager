class StaticPagesController < ApplicationController
  def home
  end
  def show
    if is_logged_in?
      redirect_to new_path
    else
      redirect_to root_path
    end
  end
end
