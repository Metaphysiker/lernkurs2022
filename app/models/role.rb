class Role < ApplicationRecord

  has_many :user_roles
  has_many :users, through: :user_roles

  def self.roles
    ["admin", "teacher", "student"]
  end

end
