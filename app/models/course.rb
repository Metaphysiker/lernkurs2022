class Course < ApplicationRecord
  has_many :slides

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image do |attachable|
    attachable.variant :cardimage, resize_to_limit: [400, 300]
  end

  has_one_attached :medal_image

  after_create :create_slide

  def self.options
    ["ethik", "klimagerechtigkeit"]
  end

  def self.public_options
    ["false", "true"]
  end

  scope :public_true, -> { where(public: "true") }
  scope :public_false, -> { where(public: "false") }


  private

  def create_slide
    Slide.create(content: "<p>Hallo Welt</p>", course_id: self.id)

  end

end
