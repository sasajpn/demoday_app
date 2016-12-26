class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]
  before_action :user_check

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_url(current_user)
    end
  end

  def destroy
    @address.destroy
    redirect_to user_url(current_user)
  end

  private

  def address_params
    params.require(:address).permit(
      :user_id,
      :given_name, :family_name,
      :postal_code, :prefecture, :municipality, :street, :building)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def user_check
    @user = User.find(params[:user_id])
    redirect_to user_url(current_user), notice: "そのページはご利用いだだけません" unless current_user == @user
  end
end
