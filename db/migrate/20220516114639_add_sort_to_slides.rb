class AddSortToSlides < ActiveRecord::Migration[7.0]
  def change
    add_column :slides, :sort, :integer, default: 0
  end
end
