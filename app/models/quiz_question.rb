class QuizQuestion < ApplicationRecord
  belongs_to :quiz, optional: true
end
