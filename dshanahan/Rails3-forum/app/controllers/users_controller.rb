include UsersHelper
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:index, :edit, :update]
  before_filter :admin_user, :only => :destroy
  # GET /users
  # GET /users.json
  def index
    @title = "All users"
   # @users = User.all
@users = User.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.username
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    
      @user = User.new
      @title = "Sign up"  
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
   @user = User.find(params[:id])
    @title = "Edit user"

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
       flash[:success] = "Welcome to the forum"
     #   redirect_to @user #users_url
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        #format.json { render :json => @user, :status => :created, :location => @user }
      else
        @title = "Sign Up"
        render 'new'
        # format.html { render :action => "new" }
        #      format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        @title = "Edit user"
        render :action => "edit" 
       
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed."
        redirect_to users_path

 #   respond_to do |format|
  #    format.html { redirect_to users_url }
   #   format.json { head :ok }
  #  end
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
