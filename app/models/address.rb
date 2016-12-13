# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  given_name   :string(255)
#  family_name  :string(255)
#  postal_code  :integer
#  prefecture   :string(255)
#  municipality :string(255)
#  street       :string(255)
#  building     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :user

  def display_address
    family_name + given_name + ' ' + '〒' + postal_code.to_s + ' ' + prefecture + municipality + street + building
  end
end
