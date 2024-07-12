class OrdersController < ApplicationController
  before_action :move_to_signed_in

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @post = Post.find(params[:post_id])
    @form = Form.new
    if  @post.order.present? || current_user == @post.user
      redirect_to root_path
    end
  end

  def create
  @post = Post.find(params[:post_id])
  @form = Form.new(form_params)
     if @form.valid? 
      pay_item

     @form.save
    redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
     amount: @post.price,  
     card: form_params[:token],   
     currency: 'jpy'             
   )
  end


  def form_params
  params.require(:form).permit(:postal_code, :prefecture_id, :city, :street, :building, :tell_number).merge(user_id: current_user.id, post_id: params[:post_id], token: params[:token])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  root_path
    end
  end
end
