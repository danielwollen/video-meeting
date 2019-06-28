class User < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
end
