class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :encrypted_password, presence: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :ruby_last,          presence: true
  validates :ruby_first,         presence: true
  validates :birth,              presence: true
end
