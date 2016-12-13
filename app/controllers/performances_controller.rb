class PerformancesController < ApplicationController
  before_action :set_parent_child

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      @parent_child.update_status(current_user)
      redirect_to parent_child_url(@parent_child)
    else
      render :new
    end
  end

  private

  def performance_params
    params.require(:performance).permit(:user_id, :evaluator, :evaluate, :comment)
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:parent_child_id])
  end
end
