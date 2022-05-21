class AddDescriptionToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :description, :text, default: ""
  end
end
