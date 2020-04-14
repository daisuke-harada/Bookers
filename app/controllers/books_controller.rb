class BooksController < ApplicationController
  before_action :authenticate_user!

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
           redirect_to books_path
    end
  end

  def show
    @book_find = Book.find(params[:id])
    @user = @book_find.user
    @book = Book.new
  end

  def index
  	@books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:created] = 'You have creatad book successfully.'
    else
      @books = Book.all
      @user = current_user
      render 'books/index'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:update] = 'You have updated book successfully.'
    else
      render 'books/edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
