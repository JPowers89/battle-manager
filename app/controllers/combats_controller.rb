# frozen_string_literal: true

# Combats represent the flow of battle.
class CombatsController < ApplicationController
  before_action :set_combat, only: %i[show edit update destroy add]
  before_action :validate_access

  def add
    @combatant = @combat.combatants.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = current_user
    if user.combats.first.nil?
      combat = user.combats.build
      combat.save
    end
    redirect_to user.combats.first
  end

  def new() end

  def show
    # During initiative roll, position is set, then used for sorting.
    @combat.combatants.sort_by { :position }
  end

  private

  def set_combat
    @combat = Combat.find(params[:id])
  end

  def validate_access
    if logged_in?
      if @combat && !current_user?(@combat.user)
        flash[:danger] = 'You are not authorized to do that.'
        redirect_to root_url
      end
    else
      flash[:danger] = 'You must be logged in to do that.'
      redirect_to root_url
    end
  end
end
