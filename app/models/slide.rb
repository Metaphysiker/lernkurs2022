class Slide < ApplicationRecord
  belongs_to :course, optional: true

  after_create :set_sort

  private

  def set_sort
    highest_value = self.course.slides.order(:sort).last.sort
    self.update(sort: highest_value + 1)
  end

end
