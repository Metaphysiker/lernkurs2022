class Quiz < ApplicationRecord
  has_many :quiz_questions
  belongs_to :slide, optional: true
end
