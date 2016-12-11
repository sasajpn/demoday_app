class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :user_check

  def show
  end

  def edit
    @address = @user.addresses.new
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to parents_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = current_user
  end

  def user_check
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_url, notice: "そのページはご利用いだだけません"
    end
  end
end
