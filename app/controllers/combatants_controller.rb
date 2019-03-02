# frozen_string_literal: true

# Combatants are states of characters as they exist in a combat
class CombatantsController < ApplicationController
  before_action :set_combatant, only: %i[show edit update destroy]

  # GET /combatants
  # GET /combatants.json
  def index
    @combatants = Combatant.all
  end

  # GET /combatants/1
  # GET /combatants/1.json
  def show() end

  # GET /combatants/new
  def new
    @combatant = Combatant.new
  end

  # GET /combatants/1/edit
  def edit() end

  # POST /combatants
  # POST /combatants.json
  def create
    combat = Combat.find_by(id: combatant_params[:combat_id])
    (1..combatant_params[:count].to_i).each do
      combatant = combat.combatants.build(combatant_params)
      combatant.save
    end
    redirect_to combat
  end

  # PATCH/PUT /combatants/1
  # PATCH/PUT /combatants/1.json
  def update
    respond_to do |format|
      if @combatant.update(combatant_params)
        format.html do
          redirect_to @combatant,
                      notice: 'Combatant was successfully updated.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /combatants/1
  # DELETE /combatants/1.json
  def destroy
    @combatant.destroy
    respond_to do |format|
      format.html do
        redirect_to combatants_url,
                    notice: 'Combatant was successfully destroyed.'
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_combatant
    @combatant = Combatant.find(params[:id])
  end

  # Never trust parameters from the internet, only allow the white list through.
  def combatant_params
    params.fetch(:combatant).permit(:name,
                                    :current_hp,
                                    :max_hp,
                                    :init_mod,
                                    :count,
                                    :combat_id)
  end
end
