class UsersController < ApplicationController
  before_action :authenticate_user!


  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def destroy
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have created book successfully."
       redirect_to user_path(@user)
    else
       render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end

