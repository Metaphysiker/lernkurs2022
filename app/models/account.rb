class Account < ApplicationRecord
  belongs_to :user, optional: true

  def course_points(course_id)
    0
  end

end
