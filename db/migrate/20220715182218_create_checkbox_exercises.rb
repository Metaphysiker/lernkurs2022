class CreateCheckboxExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :checkbox_exercises do |t|
      t.text :content, default: ""

      t.timestamps
    end
  end
end
