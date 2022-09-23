class AddSortToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :sort, :integer, default: 0
  end
end
