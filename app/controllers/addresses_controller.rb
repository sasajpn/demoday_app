class AddressesController < ApplicationController
  before_action :set_user

  def new
    @address = @user.adresses.build
  end

  def create
    @address = @user.addresses.build(address_params)
    if @address.save
      redirect_to edit_user_url(@user)
    else
      render 'user/show'
    end
  end

  def edit
  end

  def update
  end

  private

  def address_params
    params.require(:address).permit(
      :user_id,
      :given_name, :given_name_kana, :family_name, :family_name_kana,
      :postal_code, :prefecture, :municipality, :street, :building)
  end

  def set_user
    @user = current_user
  end
end
