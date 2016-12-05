class ChildrenController < ApplicationController
  before_action :set_child, only: [:destroy]
  before_action :no_book, only: [:create]
  before_action :set_parent, except: [:destroy]

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    redirect_to parents_url if @child.save
  end

  def destroy
    @child.destroy
    redirect_to parents_url
  end

  private

  def child_params
    params.require(:child).permit(:book_id, :parent_id, :recommend)
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def no_book
    if current_user.books.blank?
      redirect_to parents_url, notice: "マイブックが一冊も登録されていません。"
    end
  end
end
