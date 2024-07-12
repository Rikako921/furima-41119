class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,only: [:edit, :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")

  end
  
  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
      end
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    if @post.order.present?
      redirect_to root_path
    end
  end

def update
  if @post.update(posts_params)
    redirect_to post_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @post.destroy
  redirect_to root_path
end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:image, :title, :contents, :price, :category_id, :condition_id, :shipping_id, :prefecture_id, :schedule_id)
  end

  def correct_user
    if @post.user != current_user
      redirect_to root_path
    # else @post.sold_out?
    #   redirect_to root_path
    end
  end

end

