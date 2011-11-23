class PostsController < ApplicationController
  before_filter :load_forum_and_topic

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = @topic.posts.find(params[:id])

    respond_to do |format|
      format.html { redirect_to(topic_path(@topic)) }
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
   # GET /posts/new.xml
   def new
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build
  
     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @post }
     end
   end
  
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end
  
  # # POST /posts
  # # POST /posts.xml
  def create
    
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    @post.user_id = current_user.id
    

    respond_to do |format|
      if @post.save
        format.html { redirect_to(topic_post_path(@topic,@post), :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to([@topic], :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    def load_forum_and_topic
      @topic = Topic.find(params[:topic_id])
      @forum = @topic.forum
    end
end
