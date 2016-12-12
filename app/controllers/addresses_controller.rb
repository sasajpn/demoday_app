class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :create]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.adresses.build
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to user_addresses_url(current_user)
    else
      render 'user/show'
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
    redirect_to user_addresses_url(current_user)
  end

  private

  def address_params
    params.require(:address).permit(
      :user_id,
      :given_name, :given_name_kana, :family_name, :family_name_kana,
      :postal_code, :prefecture, :municipality, :street, :building)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
