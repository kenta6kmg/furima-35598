class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :buys



with_options presence: true do
  validates :nickname
  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
    validates :last_name
    validates :first_name
  end
  with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
    validates :ruby_last
    validates :ruby_first
  end
  validates :password,format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :birth
  end
end



