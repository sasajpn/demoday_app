class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
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
      redirect_to user_books_url(current_user)
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
end
