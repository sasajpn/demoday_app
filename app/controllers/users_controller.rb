class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_check

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to user_url(current_user)
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

  def user_check
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_url, notice: "そのページはご利用いだだけません"
    end
  end
end
