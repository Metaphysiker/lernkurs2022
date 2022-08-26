class Course < ApplicationRecord
  has_many :slides

  has_one_attached :image do |attachable|
    attachable.variant :cardimage, resize_to_limit: [400, 300]
  end

  has_one_attached :medal_image

  def self.options
    ["ethik", "klimagerechtigkeit"]
  end

end
