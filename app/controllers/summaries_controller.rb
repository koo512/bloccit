class SummariesController < ApplicationController
  def new
    @post=Post.find(params[:post_id])
    @summary = Summary.new
  end

  def show
  end

  
end
