class AccountPolicy < ApplicationPolicy
  include ActionController::Cookies
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
    if record.user.present?
      record.user == user
    else
      true
    end
    #@account == Account.find(cookies["philosophie-lernkurs-account-id"]) || user.present? && user.admin?
  end

  def new?
    user.present? && user.admin?
  end

end
