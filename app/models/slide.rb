class Slide < ApplicationRecord
  belongs_to :course, optional: true
  has_many :quizzes

  after_create :set_sort

  def previous_slide_id
    previous_slide = self.course.slides.where(sort: self.sort - 1)
    if previous_slide.empty?
      return -1
    else
     return previous_slide.first.id
    end
  end

  def next_slide_id
    next_slide = self.course.slides.where(sort: self.sort + 1)
    if next_slide.empty?
      return -1
    else
     return next_slide.first.id
    end
  end

  private

  def set_sort
    highest_value = self.course.slides.order(:sort).last.sort
    self.update(sort: highest_value + 1)
  end

end
