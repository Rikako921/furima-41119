class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :orders
         validates :name, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
         validates :kanafirst_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :kanalast_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i}
         
        end
