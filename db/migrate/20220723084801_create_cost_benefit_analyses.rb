class CreateCostBenefitAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_benefit_analyses do |t|
      t.references :slide, foreign_key: true
      t.text :content, default: ""
      t.text :cost, default: ""
      t.text :benefit

      t.timestamps
    end
  end
end
