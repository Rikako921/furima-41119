class ArrivedAt < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :city, presence: true
  validates :street, presence: true
  validates :tell_number, presence: true, format: { with: /\A\d{10,11}\z/ }

end
