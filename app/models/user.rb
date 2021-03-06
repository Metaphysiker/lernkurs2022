class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :magic_link_authenticatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one :account

  def admin?
    self.roles.where(name: "admin").exists?
  end

end
