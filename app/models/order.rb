class Order < ApplicationRecord
  has_one :arrived_at
  belongs_to :post
  belongs_to :user

end
