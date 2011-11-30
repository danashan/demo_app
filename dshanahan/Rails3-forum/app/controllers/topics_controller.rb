class TopicsController < ApplicationController
#  before_filter :load_forum, :except => [:show, :edit, :update]
 # before_filter :load_forum
  before_filter :authenticate, :only => [:edit, :update, :destroy, :new]
  # GET /topics
  # GET /topics.xml
  def index
    @topics = Topic.all
    #@topics = @forum.topics
    
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @topics }
     end
   end

  # GET /topics/1
  # GET /topics/1.xml
  def show
 @topic = Topic.find(params[:id])

 #   @forum = Forum.find(params[:forum_id])
#    @topic = @forum.topics.find(params[:id])
    #@topic = Topic.find(params[:id])
    
    
   @post = @topic.posts.all
 #   @post = @topic.posts.build

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = Topic.new
 #  @topic = @forum.topics.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
 #   @topic = correctUser.topic.find(params[:topic])
  end

  # POST /topics
  # POST /topics.xml
   def create
  @topic = Topic.new(params[:topic])
  @topic.user_id = current_user.id


     #   @topic = @forum.topics.build(params[:topic])
    #    @topic.user_id = params[:user][:user_id]#[:forum_id]
     #   @topic.title = params[:user_id][:topic_id]

      respond_to do |format|
        if @topic.save
          format.html {redirect_to([@forum,@topic], :notice => 'Topic was successfully created.') }
          format.xml  { render :xml => @topic, :status => :created, :location => @topic }
        else
          format.html { render :action => "new" }
                 format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to(@topic, :notice => 'Topic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(topics_url) }
      format.xml  { head :ok }
    end
  end
  
   private

          def authenticate
            deny_access unless signed_in?
          end
           def correct_user
                @user = User.find(params[:id])
                redirect_to(root_path) unless current_user?(@user)
              end

             def admin_user
               redirect_to(root_path) unless current_user.admin?
             end

 end
 end
   # def load_forum
   #      if (params[:id])
   #        @topic = Topic.find(params[:id]) # rescue redirect_to(forum_topics_path)
   #        @forum = @topic.forum rescue redirect_to(forums_path)
   #      elsif (params[:forum_id])
   #       @forum = Forum.find(params[:forum_id]) # rescue redirect_to(forums_path)
   #      else # topics index
   #        redirect_to(forums_path)
   #      end
   #    end
   # end
   