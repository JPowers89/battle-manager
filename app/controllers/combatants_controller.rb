class CombatantsController < ApplicationController
  before_action :set_combatant, only: [:show, :edit, :update, :destroy]

  # GET /combatants
  # GET /combatants.json
  def index
    @combatants = Combatant.all
  end

  # GET /combatants/1
  # GET /combatants/1.json
  def show
  end

  # GET /combatants/new
  def new
    @combatant = Combatant.new
  end

  # GET /combatants/1/edit
  def edit
  end

  # POST /combatants
  # POST /combatants.json
  def create
    @combatant = Combatant.new(combatant_params)

    respond_to do |format|
      if @combatant.save
        format.html { redirect_to @combatant, notice: 'Combatant was successfully created.' }
        format.json { render :show, status: :created, location: @combatant }
      else
        format.html { render :new }
        format.json { render json: @combatant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combatants/1
  # PATCH/PUT /combatants/1.json
  def update
    respond_to do |format|
      if @combatant.update(combatant_params)
        format.html { redirect_to @combatant, notice: 'Combatant was successfully updated.' }
        format.json { render :show, status: :ok, location: @combatant }
      else
        format.html { render :edit }
        format.json { render json: @combatant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combatants/1
  # DELETE /combatants/1.json
  def destroy
    @combatant.destroy
    respond_to do |format|
      format.html { redirect_to combatants_url, notice: 'Combatant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combatant
      @combatant = Combatant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combatant_params
      params.fetch(:combatant, {})
    end
end
