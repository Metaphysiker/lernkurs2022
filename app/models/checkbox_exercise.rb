class CheckboxExercise < ApplicationRecord
  has_many :checkboxes
  has_one :point_system, :as => :pointsystemable
  belongs_to :slide, optional: true

  after_create :create_point_system

  private

  def create_point_system
    PointSystem.create(
      total_possible_points: 3,
      points_deduction_for_mistake: 1,
       pointsystemable_id: self.id,
       pointsystemable_type: self.class.name
     )
  end
end
