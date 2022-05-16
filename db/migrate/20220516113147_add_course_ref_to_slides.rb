class AddCourseRefToSlides < ActiveRecord::Migration[7.0]
  def change
    add_reference :slides, :course, foreign_key: true
  end
end
