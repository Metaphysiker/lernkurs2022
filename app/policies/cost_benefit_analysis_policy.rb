class CostBenefitAnalysisPolicy < ApplicationPolicy
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
    true
  end

  def new?
    user.present? && user.admin?
  end

  def edit?
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
