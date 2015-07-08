class FavoritesController < ApplicationController

  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     authorize favorite

     if favorite.save
      flash[:notice] = "Added to Favorites!"
      redirect_to [post.topic, post]
     else
      flash[:error] = "Unable to add post to favorites. Try again, or reach out to admin if problem persists."
      redirect_to [post.topic, post]
     end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorited(post)
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post removed from favorites."
      redirect_to [post.topic, post]
    else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to [post.topic, post]
    end
  end

end
