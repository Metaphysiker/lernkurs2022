class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.string :name, default: ""
      t.text :alt_text, default: ""

      t.timestamps
    end
  end
end
