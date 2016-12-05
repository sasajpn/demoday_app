class ParentChildrenController < ApplicationController
  before_action :set_parent_child, only: [:show]
  before_action :set_parent

  def show
    @parent_user = @parent_child.parent.book.user
    @child_user = @parent_child.child.book.user
  end

  def create
    @parent_child = ParentChild.new(parent_child_params)
    redirect_to parent_url(@parent) if @parent_child.save
  end

  private

  def parent_child_params
    params.require(:parent_child).permit(:parent_id, :child_id)
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:id])
  end

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end
end
