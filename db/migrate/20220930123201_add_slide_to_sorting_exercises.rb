class AddSlideToSortingExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :sorting_exercises, :slide, foreign_key: true
  end
end
