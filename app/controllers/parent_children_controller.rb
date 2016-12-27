class ParentChildrenController < ApplicationController
  before_action :set_parent_child, only: [:show, :update]
  before_action :become_deadline, only: [:create]
  before_action :set_parent, except: [:update, :show]
  before_action :user_check, except: [:create]

  def show
  end

  def create
    @parent_child = ParentChild.new(parent_child_params)
    redirect_to parent_url(@parent) if @parent_child.save
  end

  def update
    if @parent_child.update(parent_child_params)
      redirect_to parent_child_messages_url(@parent_child)
    end
  end


  private

  def parent_child_params
    params.require(:parent_child).permit(:parent_id, :child_id, :parent_confirm, :child_confirm)
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:id])
  end

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def become_deadline
    @parent = Parent.find(params[:parent_id])
    if @parent.deadline < Time.now()
      redirect_to parent_url(@parent), notice: "その本の取引は終了しています"
    end
  end

  def user_check
    @parent_child = ParentChild.find(params[:id])
    @parent = @parent_child.parent.user
    @child = @parent_child.child.user
    redirect_to user_url(current_user), notice: "そのページはご利用いだだけません" unless current_user == @parent || current_user == @child
  end
end
