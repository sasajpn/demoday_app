class ParentsController < ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_parent, only: [:show, :update]
  before_action :already_negotiate, only: [:create]

  def index
    @parents = Parent.within_deadline.order(deadline: :desc).page(params[:page])
    @popular_parent = Parent.order(children_count: :desc).limit(3)
    @books = current_user.books.not_parent.not_child
  end

  def show
  end

  def create
    @parent = Parent.new(parent_params)
    redirect_to user_url(current_user) if @parent.save
  end

  def update
    if @parent.update(parent_params)
      redirect_to parent_child_url(@parent.parent_child)
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:book_id, :deadline, :status, :address_id)
  end

  def already_negotiate
    @book = Book.find(params[:book_id])
    if @book.already_negotiate?
      redirect_to user_url(current_user), notice: "すでに取引中です。"
    end
  end
end
