class Cloze < ApplicationRecord
  belongs_to :slide, optional: true

  has_one :point_system, :as => :pointsystemable

  after_create :create_point_system

  def text_with_input_fields
    new_text = self.text

    self.text.scan(/\[.\]/).each do |match|
      number = match.scan(/\d+/).first

html_string = <<MARKER
<div class="text-center my-3">
  <input type="text" class="input-cloze-#{self.id} form-control form-control-lg" placeholder="Antwort eingeben" data-input-id="#{number}">
</div>

MARKER

      new_text = new_text.gsub(/\[#{number}\]/, html_string)
    end
    new_text
  end

  private

  def create_point_system
    PointSystem.create(
      total_possible_points: 3,
      points_deduction_for_mistake: 1,
       pointsystemable_id: self.id,
       pointsystemable_type: self.class.name
     )
  end

end
