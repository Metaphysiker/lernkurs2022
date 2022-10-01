class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def check_if_email_is_taken?
    true
  end

  def successfully_signed_in?
    true
  end

end
