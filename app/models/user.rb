class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates_presence_of :email, :password, :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday
  validates :email, uniqueness: {case_sensitive: true}, format: { with: /\A.+?@.+\z/ }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
  validates :first_name_furigana, :last_name_furigana, format: { with: /\A[ァ-ン]+\z/ }
end
