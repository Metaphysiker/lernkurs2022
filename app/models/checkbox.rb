class Checkbox < ApplicationRecord
  belongs_to :checkbox_exercise

  def self.correct_answer_options
    ["yes", "no"]
  end

end
