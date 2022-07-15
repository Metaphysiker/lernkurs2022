class CreateQueckboxExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :queckbox_exercises do |t|
      t.text :content, default: ""

      t.timestamps
    end
  end
end
