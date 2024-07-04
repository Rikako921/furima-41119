class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new 
    # @post = Post.new
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

  # def show
  #    @post = Post.find(params[:id])
  # end



  private

  def posts_params
    params.require(:post).permit(:image, :title, :contents, :price, :category_id, :condition_id, :shipping_id, :prefecture_id, :schedule_id)
  end

end

