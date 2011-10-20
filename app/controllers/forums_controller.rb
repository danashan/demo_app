class ForumsController < ApplicationController
  def index
    @forums = Forum.all
    
    respond_to do |format|
      format.html #index.html.erb
      
    end
  end
  
  def new
    @forum = Forum.new
  end

def show
  @forum = Forum.find(params[:id])
  respond_to do |format|
    format.html #show.html.erb
  end
end

  def create
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to root_url, :notice => "Successfully created forum."
    else
      render :action => 'new'
    end
  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      redirect_to root_url, :notice  => "Successfully updated forum."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to root_url, :notice => "Successfully destroyed forum."
  end
end
