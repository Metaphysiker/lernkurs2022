class AddSlideRefToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_reference :quizzes, :slide, foreign_key: true
  end
end
