# frozen_string_literal: true

# Combats represent the flow of battle.
class CombatsController < ApplicationController
  before_action :set_combat, only: %i[show edit update destroy add remove roll stop next previous]
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

  def next
    found = false
    @combat.combatants.each do |combatant|
      combatant.active = true if found
      found = false
      if combatant.active?
        combatant.update_attribute(:active, false)
        found = true
      end
    end
    redirect_to @combat unless found
    @combat.round += 1
    @combat.combatants.first.update_attribute(:active, true)
    @combat.save
    redirect_to @combat
  end

  def remove
    params[:combatants].each do |id|
      Combatant.find(id).destroy
    end
    @combat.reload
    set_active_combatant(@combat)
    stop_combat @combat unless @combat.combatants.any?
  end

  def roll
    @combat.active = true
    @combat.save
    @combat.combatants.each do |combatant|
      combatant.update_attribute(:initiative, rand(1..20) + combatant.init_mod)
    end
    @combat.combatants.sort_by(&:initiative).reverse.each_with_index do |combatant, pos|
      combatant.update_attribute(:active, true) if pos.zero?
      combatant.update_attribute(:position, pos)
    end
    redirect_to @combat
  end

  def update
    if params[:combatants]
      params[:combatants].each do |combatant|
        # the param comes over as an array. one day i'll fix that...
        the_combatant = Combatant.find(combatant[1][:id])
        the_combatant.update_attribute(:position, combatant[1][:position])
      end
    end
    @combat.reload
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    # During initiative roll, position is set, then used for sorting.
    # Sorting is done in the model
  end

  def stop
    stop_combat @combat
    redirect_to @combat
  end

  private

  def set_active_combatant(combat)
    return unless combat.active?

    return unless combat.combatants.any?

    return if combat.combatants.any?(&:active?)

    combat.combatants.first.update_attribute(:active, true)
  end

  def set_combat
    @combat = Combat.find(params[:id])
  end

  def stop_combat(combat)
    combat.active = false
    combat.round = 1
    combat.combatants.each do |combatant|
      combatant.update_attributes(initiative: 0, position: -1, active: false)
    end
    combat.save
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
