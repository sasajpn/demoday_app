class ChildrenController < ApplicationController
  before_action :set_child, only: [:update, :destroy]
  before_action :no_book, only: [:create]
  before_action :become_deadline, only: [:new, :create]
  before_action :already_done, only: [:new, :create]
  before_action :already_negotiate, only: [:create]

  def new
    @child = Child.new
    @books = current_user.books - (current_user.books.joins(:parent) + current_user.books.joins(:child))
  end

  def create
    @child = Child.new(child_params)
    redirect_to parents_url if @child.save
  end

  def update
    redirect_to parent_child_url(@child.parent_child) if @child.update(child_params)
  end

  def destroy
    @child.destroy
    redirect_to parents_url
  end

  private

  def child_params
    params.require(:child).permit(:book_id, :parent_id, :recommend, :status, :address_id)
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def no_book
    if current_user.books.blank?
      redirect_to parents_url, notice: "マイブックが一冊も登録されていません。"
    end
  end

  def become_deadline
    @parent = Parent.find(params[:parent_id])
    if @parent.deadline < Time.now()
      redirect_to parents_url, notice: "その本の取引は終了しています。"
    end
  end

  def already_done
    @parent = Parent.find(params[:parent_id])
    if @parent.parent_child.present?
      redirect_to parents_url, notice: "その本の取引は終了しています。"
    end
  end

  def already_negotiate
    @book = Book.find(params[:child][:book_id])
    if @book.parent.present? || @book.child.present?
      redirect_to parents_url, notice: "その本はすでに取引に出しています"
    end
  end
end
