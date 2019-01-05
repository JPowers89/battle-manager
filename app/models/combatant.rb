class Combatant < ApplicationRecord
  belongs_to :combat
  before_save :increment_name

  private

    # Increments a number at the end of the combatant name if a duplicate exists
    # For example; If the name is Monster, and Monster 7 exists, it's renamed to Monster 8
    def increment_name
      names = find_similiar_names(self[:combat][:combatants])
      if !names.empty?
        num = names.last.scan('/\s\d/')
        index = num.empty? ? 1 : num.strip.to_i + 1
           
        self[:name] = "#{self[:name]} #{index}"
      end      
    end
    
    # Finds names of other combatants that start with a similiar name. 
    # Combatants across the db cane have duplicate names, but not for the same combatant. 
    # Params:
    # +combatants+:: list of all combatants in the combat
    # @return [String[]]
    def find_similiar_names(combatants)
      matching_names = []

      combatants.each do |combatant|
        matching_names << combatant[:name] if combatant[:name].match?("/#{self[:name]}\s/")
      end

      matching_names.sort
    end
end
