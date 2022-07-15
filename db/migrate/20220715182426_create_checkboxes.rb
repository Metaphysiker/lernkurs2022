class CreateCheckboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :checkboxes do |t|
      t.text :content
      t.references :checkbox_exercise, foreign_key: true

      t.timestamps
    end
  end
end
