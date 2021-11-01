class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :recoverable, :rememberable, :validatable # , :database_authenticatable, :registerable,

  devise :database_authenticatable, authentication_keys: [:email]
end
