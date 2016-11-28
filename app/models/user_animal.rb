# == Schema Information
#
# Table name: user_animals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  animal_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserAnimal < ActiveRecord::Base
  belongs_to :user
  belongs_to :animal
end
