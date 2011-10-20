class PostsController < ApplicationController
  before_filter :set_topic

def new
  @post = @topic.posts.build
  respond_to do |format|
    format.html
  end
end

  def create
    @post = @topic.posts.new(params[:post])
    
    if @post.save
      redirect_to (@topic, :notice => "Successfully created post.")
    else
      redirect_to(@topic, :alert => "Could not add post")
    end
  end
  

  def edit
    @post = Post.find(params[:id])
  end



  def destroy
    @post = @topic.posts.find(params[:id])
    @post.destroy
    
    
    #redirect_to @topic, :notice => "#{@post.user}Successfully destroyed post."
  #end
  
  private
  
  def set_topic
    @topic = Topic.find(params[:topic_id])
end
end