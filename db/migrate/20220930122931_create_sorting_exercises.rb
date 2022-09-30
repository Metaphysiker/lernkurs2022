class CreateSortingExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :sorting_exercises do |t|
      t.text :content, default: ""
      t.text :solution, default: ""

      t.timestamps
    end
  end
end
