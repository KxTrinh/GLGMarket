class Api::V1::PostsController < Api::V1::BaseController

  def my_posts
    @posts = policy_scope(Post).where(user: current_user)
    # @posts = current_user.posts.all
  end

  def index
    @posts = policy_scope(Post)
  end

end
