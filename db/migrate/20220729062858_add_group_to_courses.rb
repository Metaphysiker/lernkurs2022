class AddGroupToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :group, :string, default: ""
  end
end
