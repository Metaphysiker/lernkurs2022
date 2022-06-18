class AddProgressDataToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :courses, :jsonb, default: {}
    add_column :accounts, :exercises, :jsonb, default: {}
  end
end
