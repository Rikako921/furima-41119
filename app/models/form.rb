class Form
  include ActiveModel::Model
  attr_accessor  :token, :user_id, :post_id,:postal_code, :prefecture_id, :city, :street, :building, :tell_number

  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :street, presence: true
    validates :tell_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id 
    validates :post_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    order = Order.create(user_id: user_id, post_id: post_id)

    ArrivedAt.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street: street,
      building: building,
      tell_number: tell_number,
      order_id: order.id
    )
  end
end