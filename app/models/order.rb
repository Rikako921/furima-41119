class Order < ApplicationRecord
  has_one :arrived_at
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true

end
