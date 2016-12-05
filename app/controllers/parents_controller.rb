class ParentsController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :already_negotiate, only: [:create]

  def index
    @parents = Parent.where('deadline > ?', Time.now()).order("deadline DESC").page(params[:page])
  end

  def show
    @parent = Parent.find(params[:id])
    @children = Child.where(parent_id: @parent.id)
  end

  def create
    @parent = Parent.new(parent_params)
    redirect_to user_books_url(@book.user) if @parent.save
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def parent_params
    params.require(:parent).permit(:book_id, :deadline)
  end

  def already_negotiate
    @book = Book.find(params[:book_id])
    if @book.already_negotiate?
      redirect_to user_books_url(@book.user), notice: "すでに取引中です。"
    end
  end
end
