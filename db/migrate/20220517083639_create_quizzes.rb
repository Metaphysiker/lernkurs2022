class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.text :content, default: ""

      t.timestamps
    end
  end
end
