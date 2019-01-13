# frozen_string_literal: true

# Controller for view pages that don't have models
class StaticPagesController < ApplicationController
  def home() end

  def show
    if is_logged_in?
      redirect_to new_path
    else
      redirect_to root_path
    end
  end
end
