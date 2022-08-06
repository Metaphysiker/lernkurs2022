class AddSaveProgressToSlide < ActiveRecord::Migration[7.0]
  def change
    add_column :slides, :save_progress, :string, default: "false"
    add_column :slides, :course_complete, :string, default: "false"
  end
end
