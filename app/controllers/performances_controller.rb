class PerformancesController < ApplicationController
  before_action :set_parent_child

  def edit
  end

  def update
    if @performance.update(performance_params)
      @parent_child.update_status(current_user)
      redirect_to parent_child_url(@parent_child), notice: "取引相手を評価しました。"
    else
      render :edit
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:user_id, book_id)
  end

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:parent_child_id])
  end
end
