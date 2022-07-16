class CreateClozes < ActiveRecord::Migration[7.0]
  def change
    create_table :clozes do |t|
      t.text :content, default: ""
      t.text :correct_answer, default: ""
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
