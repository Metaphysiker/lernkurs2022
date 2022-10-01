class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
     def resolve
       scope.all
     end
  end

  def index?
    true
  end

  def show?
    true
  end

  def show_with_swipe?
    true
  end

  def new?
    user.present? && user.admin?
  end

  def edit?
    user.present? && user.admin?
  end

  def course_overview
    user.present? && user.admin?
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    user.present? && user.admin?
  end

  def destroy?
    user.present? && user.admin?
  end

end
