class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A.+?@.+\z/ }
    validates :password, confirmation: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :password_confirmation
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_name_furigana, :last_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
