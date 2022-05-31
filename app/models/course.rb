class Course < ApplicationRecord
  has_many :slides

  has_one_attached :image

end
