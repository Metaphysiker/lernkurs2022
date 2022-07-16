class CreateOpenQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :open_questions do |t|
      t.references :slide, foreign_key: true
      t.text :content, default: ""
      t.text :correct_answer, default: ""

      t.timestamps
    end
  end
end
