class StaticPagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def welcome?
    true
  end

  def preparer?
    true
  end

  def test_seite?
    true
  end

end
