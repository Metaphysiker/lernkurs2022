class CreateQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_questions do |t|
      t.text :content, default: ""
      t.string :correct_answer, default: "no"

      t.timestamps
    end
  end
end
