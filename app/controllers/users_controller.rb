class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
      flash[:notice] = "User was created successfully"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "Task was edited successfully"
    else
      render :edit
    end
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: "The task has been successfully deleted"
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
