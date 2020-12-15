class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presense: true, uniqueness: true, format: { with: /\A.+?@.+\z/ }
         validates :encrypted_password, presense: true, length: { minimum: 6 } ,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
         validates :first_name, :last_name, presense: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :first_name_furigana, :last_name_furigana, presense: true, format: { with: /\A[ァ-ン]+\z/ }
         validates :birthday, presense: true

end