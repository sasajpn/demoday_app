# == Schema Information
#
# Table name: user_book_wants
#
#  id             :integer          not null, primary key
#  parent_id      :integer
#  parent_want_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class UserBookWant < ActiveRecord::Base
  belongs_to :parent
  belongs_to :parent_want
end
