class Combat < ApplicationRecord
  belongs_to :user
  has_many :combatants, dependant: :destroy
end
