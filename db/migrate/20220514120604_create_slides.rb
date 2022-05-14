class CreateSlides < ActiveRecord::Migration[7.0]
  def change
    create_table :slides do |t|
      t.text :content, default: ""

      t.timestamps
    end
  end
end
