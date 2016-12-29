# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  given_name   :string(255)
#  family_name  :string(255)
#  postal_code  :string(255)
#  prefecture   :string(255)
#  municipality :string(255)
#  street       :string(255)
#  building     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :user

  validates :given_name, :family_name,
    presence: true,
    length: { maximum: 64 }

  validates :postal_code, :prefecture, :municipality, :street, :building,
    presence: true,
    length: { maximum: 64 }


  def display_address
    name = [family_name, given_name].compact.join
    address = [postal_code, prefecture, municipality, street, building].compact.join
    [name, address].join(" ")
  end
end
