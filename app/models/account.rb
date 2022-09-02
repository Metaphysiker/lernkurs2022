class Account < ApplicationRecord
  belongs_to :user, optional: true

  def course_points(course_id)

    points = 0

    if exercises.key?(course_id.to_s)
      exercises[course_id.to_s]["exercises"].each do |exercise|
        points = points + exercise["points_scored"].to_i
      end
    end

    points

  end

  def check_if_medal_is_awarded(course_id)

    points = self.course_points(course_id)
    total_possible_points =  self.total_possible_course_points(course_id)

    medal_awarded = points > (total_possible_points.to_f/100 * 80)

  end

  def total_possible_course_points(course_id)

    points = 0

    course = Course.find(course_id)

    course.slides.each do |slide|
      unless slide.exercise.nil?
        points += slide.exercise.point_system.total_possible_points unless slide.exercise.point_system.nil?
      end
    end

    points

  end

end
