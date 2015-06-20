class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post=Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:title, :body))
    @summary.post = @post
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to topic_post_summary_path(@topic, @post, @summary)
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(params.require(:summary).permit(:title, :body))
      flash[:notice] = "Summary was saved."
      redirect_to topic_post_summary_path(@topic, @post, @summary)
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

end
