class PostsController < ApplicationController
  before_filter :load_forum_and_topic
  
  # GET /posts
  # GET /posts.json

  def index
    @posts = @topic.posts.all

    respond_to do |format|
      format.html { redirect_to(topic_path(@topic)) } # index.html.erb
      format.json { render :json => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
#    @post = @topic.posts.find(params[:id])
    @post = Post.find(params[:id])      #new commnet out prev line
    respond_to do |format|
      format.html { redirect_to(topic_path(@topic)) }# show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @topic.posts.build
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])         #new
    @post = @topic.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @topic, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
  private
  def load_forum_and_topic
    @topic = Topic.find(params[:topic_id])
    @forum = @topic.forum
  end
end
