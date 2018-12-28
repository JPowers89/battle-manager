class CombatsController < ApplicationController
  before_action :set_combat, only: [:show, :edit, :update, :destroy]
  before_action :validate_access, only: [:show, :update, :edit, :destroy, :new]

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
    @combat.combatants.sort_by { |cb| cb.position } #During initiative roll, position is set, then used going forward for sorting.
  end  

  private
    def set_combat
      @combat = Combat.find(params[:id])
    end
    
    def validate_access
      if logged_in?
        if @combat && !current_user?(@combat.user)
          flash[:danger] = "You are not authorized to do that."
          redirect_to root_url
        end
      else
        flash[:danger] = "You must be logged in to do that."
        redirect_to root_url
      end
    end
end
