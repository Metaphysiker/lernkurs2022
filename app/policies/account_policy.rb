class AccountPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.present? && user.admin?
  end

  def show?
    standard_account_check
  end

  def new?
    standard_account_check
  end

  def edit?
    standard_account_check
  end

  def create?
    standard_account_check
  end

  def update?
    standard_account_check
  end

  def update_course_status?
    standard_account_check
  end

  def update_course_history?
    standard_account_check
  end

  def update_excercise_history?
    standard_account_check
  end

  def get_points_from_course?
    standard_account_check
  end

  def check_if_medal_is_awarded?
    standard_account_check
  end

  def destroy?
    standard_account_check
  end

  def users_sign_up?
    true
  end

  def save_progress?
    standard_account_check
  end

  def dashboard?
    user.present? && user.admin?
  end

end

def standard_account_check
  if user.present? && user.admin?
    true
  elsif record.user.present?
    record.user == user
  else
    true
  end
end
