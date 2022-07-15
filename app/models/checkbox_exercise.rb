class CheckboxExercise < ApplicationRecord
  has_many :checkboxes
  has_one :point_system, :as => :pointsystemable
end
