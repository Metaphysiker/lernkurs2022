class CheckboxPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
     def resolve
       scope.all
     end
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    user.present? && user.admin?
  end

end
