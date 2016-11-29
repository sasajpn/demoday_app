class ParentsController < ApplicationController
  before_action :set_book
  before_action :already_parent

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to user_books_url(@book.user)
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def parent_params
    params.require(:parent).permit(:book_id, :deadline)
  end

  def already_parent
    @book = Book.find(params[:book_id])
    if @book.parent.persisted?
      redirect_to user_books_url(@book.user), notice: "すでに取引中です。"
    end
  end
end
