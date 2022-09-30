class Account < ApplicationRecord
  belongs_to :user, optional: true

  def self.course_status_completed
    "completed"
  end

  def visited_courses_count
    courses.keys.count
  end

  def course_points(course_id)

    points = 0

    if exercises.key?(course_id.to_s)
      exercises[course_id.to_s]["exercises"].each do |exercise|
        points = points + exercise["points_scored"].to_i
      end
    end

    points

  end

  def course_status(course_id)

    if !self.courses.key?(course_id.to_s)
      return "unvisited"
    elsif self.courses[course_id.to_s]["status"] == "completed"
      return "completed"
    else
      return "started"
    end

  end

  def course_completion_date(course_id)

    if !self.courses.key?(course_id.to_s)
      return ""
    else
      return Date.parse(self.courses[course_id.to_s]["completion_date"])
    end

  end

  def check_if_medal_is_awarded(course_id)

    points = self.course_points(course_id)
    total_possible_points =  self.total_possible_course_points(course_id)

    medal_awarded = points > (total_possible_points.to_f/100 * 70)

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

  def all_points
    points = 0
    courses.keys.each do |key|
      points += course_points(key.to_i) if key.to_i.is_a? Integer
    end
    points
  end

end
