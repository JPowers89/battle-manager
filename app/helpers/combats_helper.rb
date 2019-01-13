# frozen_string_literal: true

# Helps manage combats and the current combat
module CombatsHelper
  def current_combat
    return nil unless (combat_id = session[:combat_id])

    @current_combat ||= Combat.find_by(id: combat_id)
  end

  def store_combat(combat)
    session[:combat_id] = combat.id
    @current_combat = combat
  end

  def destroy_combat
    session.delete(:combat_id)
    @current_combat = nil
  end
end
