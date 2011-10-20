class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end
  
  def new
   @topic = Topic.new
   respond_to do |format|
         format.html # new.html.erb
end
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to root_url, :notice => "Successfully created topic."   else
      render :action => 'new'
    end
  end

#def create  
# @topic = Topic.new(params[:topic])  
#  if @topic.save  
#    @topic = Topic.new(:name => params[:topic][:title], :last_poster_id => current_user.id, :last_post_at => Time.now, :forum_id => params[:topic][:forum_id])  
  
##    if @post.save  
#      flash[:notice] = "Successfully created topic."  
#      redirect_to "/forums/#{@topic.forum_id}"  
#    else  
 #     redirect :action => 'new'  
 #   end  
#  else  
#    render :action => 'new'  
#  end  
#end  





  def show
    @topic = Topic.find(params[:id])
   
    respond_to do |format|
      format.html #show.html.erb
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to root_url, :notice  => "Successfully updated topic."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to root_url, :notice => "Successfully destroyed topic."
  end
end
