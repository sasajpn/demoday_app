# == Schema Information
#
# Table name: parent_wants
#
#  id           :integer          not null, primary key
#  user_book_id :integer
#  parent_id    :integer
#  recommend    :text(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ParentWant < ActiveRecord::Base
  belongs_to :user_book
  belongs_to :parent
end
