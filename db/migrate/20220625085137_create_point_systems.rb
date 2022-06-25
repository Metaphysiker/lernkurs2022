class CreatePointSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :point_systems do |t|
      t.integer :total_possible_points
      t.integer :points_deduction_for_mistake
      t.references :pointsystemable, polymorphic: true
      
      t.timestamps
    end
  end
end
