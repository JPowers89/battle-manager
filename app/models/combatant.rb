# frozen_string_literal: true

# A Combatant is the core component of a combat.
# A combat has many combatants and each combatant has basic stats.
# Combatants can relate to characters for more complicated scenarios
class Combatant < ApplicationRecord
  attr_accessor :count
  belongs_to :combat
  before_create :increment_name, :set_current_hp

  validates(:name, presence: true)

  private

  # Defaults the current hp if value is 0 during creation
  def set_current_hp
    self.current_hp = max_hp if current_hp.zero?
  end
  # Increments a number at the end of the combatant name if a duplicate exists
  # E.g.; If name is Monster, and Monster 7 exists, it's renamed to Monster 8
  def increment_name
    return nil unless combat

    matches = find_similiar_names(combat.combatants)
    return nil if matches.empty? || matches.count == 1

    if matches.count == 2
      matches.first.name = "#{matches.first.name} 1"
      matches.first.save
      # matches.first.reload # I'm pretty sure i don't need this
    end
    num = matches[-2].name.scan(/\d+$/)
    # the last element is the current element
    index = num.empty? ? 1 : num.first.to_i + 1
    self.name = "#{name} #{index}"
  end

  # Finds names of other combatants that start with a similiar name.
  # Combatants can have duplicate names, but not for the same combat.
  # Params:
  # +combatants+:: list of all combatants in the combat
  # @return [String[]]
  def find_similiar_names(combatants)
    matches = []
    combatants.each do |combatant|
      matches << combatant if combatant.name.start_with?(name)
    end
    matches.sort_by { :name }
    matches
  end
end
