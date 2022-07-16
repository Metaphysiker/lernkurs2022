class AddCorrectAnswerToCheckbox < ActiveRecord::Migration[7.0]
  def change
    add_column :checkboxes, :correct_answer, :string, default: "no"
  end
end
