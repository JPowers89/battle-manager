class CombatsController < ApplicationController
  def create
    user = current_user
    if user.combats.first.nil?
      combat = user.combats.build
      combat.save
    end
    redirect_to user.combats.first
  end
  def new
  end
  def show
    @combat = Combat.find(params[:id])
  end
end
