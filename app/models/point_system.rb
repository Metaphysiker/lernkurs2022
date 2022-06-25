class PointSystem < ApplicationRecord
  belongs_to :pointsystemable, :polymorphic => true
end
