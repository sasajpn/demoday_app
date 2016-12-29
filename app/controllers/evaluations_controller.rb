class EvaluationsController < ApplicationController
  before_action :set_parent_child

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      @parent_child.update_status(current_user)
      redirect_to parent_child_url(@parent_child), notice: "取引相手を評価しました。"
    else
      render :new
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:user_id, :evaluator, :level)
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:parent_child_id])
  end
end
