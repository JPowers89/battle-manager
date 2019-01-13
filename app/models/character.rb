# frozen_string_literal: true

# Represents the finer details of a character. Characters who are added to combats become combatants.
class Character < ApplicationRecord
  belongs_to :combatant
end
