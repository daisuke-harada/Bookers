class UsersController < ApplicationController
  def index
    @users = User.all
    @bookpost = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
    books = @books
    @mybooks = @user.books
    @bookpost = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
           redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
       flash[:updateuser] = 'You have updated user successfully.'
    else
      render 'users/edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
