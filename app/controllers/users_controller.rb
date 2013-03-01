class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  
  
  
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
	unless params[:learner].nil?
		@user.learner_id = params[:learner]
	end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
	  UserMailer.new_user_msg(@user).deliver
#	  session[:user_id] = @user.id
      redirect_to home_path, :notice => "#{@user.learner.first_name} has been added as a user and notified by email."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to home_path, :notice => "#{@user.learner.first_name}'s profile has been updated."
    else
      render :action => 'edit'
    end
  end
  
  
  
  
  
  
  
  # def index
  #     @users = User.all
  # 
  #     respond_to do |format|
  #       format.html # index.html.erb
  #       format.json { render json: @users }
  #     end
  #   end
  # 
  #   # GET /users/1
  #   # GET /users/1.json
  #   def show
  #     @user = User.find(params[:id])
  # 
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.json { render json: @user }
  #     end
  #   end
  # 
  #   # GET /users/new
  #   # GET /users/new.json
  #   def new
  #     @user = User.new
  # 
  #     respond_to do |format|
  #       format.html # new.html.erb
  #       format.json { render json: @user }
  #     end
  #   end
  # 
  #   # GET /users/1/edit
  #   def edit
  #     @user = User.find(params[:id])
  #   end
  # 
  #   # POST /users
  #   # POST /users.json
  #   def create
  #     @user = User.new(params[:user])
  # 
  #     respond_to do |format|
  #       if @user.save
  #         format.html { redirect_to @user, notice: 'User was successfully created.' }
  #         format.json { render json: @user, status: :created, location: @user }
  #       else
  #         format.html { render action: "new" }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # 
  #   # PUT /users/1
  #   # PUT /users/1.json
  #   def update
  #     @user = User.find(params[:id])
  # 
  #     respond_to do |format|
  #       if @user.update_attributes(params[:user])
  #         format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #         format.json { head :no_content }
  #       else
  #         format.html { render action: "edit" }
  #         format.json { render json: @user.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # 
  #   # DELETE /users/1
  #   # DELETE /users/1.json
  #   def destroy
  #     @user = User.find(params[:id])
  #     @user.destroy
  # 
  #     respond_to do |format|
  #       format.html { redirect_to users_url }
  #       format.json { head :no_content }
  #     end
  #   end
end