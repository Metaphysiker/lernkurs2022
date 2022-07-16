class AddSlideToCheckboxExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :checkbox_exercises, :slide, foreign_key: true
  end
end
