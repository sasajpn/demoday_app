class BooksController < ApplicationController
  # before_action :authenticate_user!, only: [:show, :new, :cretate, :edit, :update, :destroy]
  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :set_user

  def index
    @books = @user.books.order(:id).page(params[:page])
  end

  def show
  end

  def new
    @book = @user.books.build
  end

  def create
    @book = @user.books.build(book_params)
    if @book.save
      redirect_to user_books_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to user_books_url
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to user_books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :status, :user_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_user
    # @user = current_user
    @user = User.find(params[:user_id])
  end
end
