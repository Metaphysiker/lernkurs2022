class Slide < ApplicationRecord
  belongs_to :course, optional: true
  has_many :quizzes
  has_many :checkbox_exercises
  has_many :open_questions
  has_many :clozes
  has_many :cost_benefit_analyses

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

  def exercise

    if self.quizzes.present?
      return self.quizzes.first
    elsif self.checkbox_exercises.present?
      return self.checkbox_exercises.first
    elsif self.open_questions.present?
      return self.open_questions.first
    elsif self.clozes.present?
      return self.clozes.first
    elsif self.cost_benefit_analyses.present?
      return self.cost_benefit_analyses.first
    else
      return nil
    end

  end

  def self.save_progress_options
    ["true", "false"]
  end

  def self.course_complete_options
    ["true", "false"]
  end


  private

  def set_sort
    if self.course.blank? || self.course.slides.count == 1
      self.update(sort: 0)
    else
      highest_value = self.course.slides.order(:sort).last.sort
      puts "HIGHEST VALUE"
      puts highest_value
      self.update(sort: highest_value + 1)
    end

  end

end
