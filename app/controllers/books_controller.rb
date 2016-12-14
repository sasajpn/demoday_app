class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :user_check, except: [:edit, :destroy]
  before_action :negotiate_now, only: [:edit, :destroy]

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to user_url(current_user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :status, :user_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def user_check
    @user = User.find(params[:user_id])
    redirect_to user_url(current_user) if @user != current_user
  end

  def negotiate_now
    @book = Book.find(params[:id])
    redirect_to user_url(current_user) if @book.already_negotiate?
  end
end
