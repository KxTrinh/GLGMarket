class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [ :show ]

  def my_posts
    @posts = policy_scope(Post).where(user: current_user)
    # @posts = current_user.posts.all
  end

  def index
    @posts = policy_scope(Post)
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post  # For Pundit
  end

end
