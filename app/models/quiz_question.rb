class QuizQuestion < ApplicationRecord
  belongs_to :quiz, optional: true

  def self.correct_answer_options
    ["yes", "no"]
  end

end
