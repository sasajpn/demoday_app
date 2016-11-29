# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  author     :string(255)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, uniqueness: true
end
