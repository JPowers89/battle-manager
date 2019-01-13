# frozen_string_literal: true

# A combat represents the current state of the battle. 
# This includes all combatants, time in round, total rounds, etc. 
class Combat < ApplicationRecord
  belongs_to :user
  has_many :combatants, dependent: :destroy
end
