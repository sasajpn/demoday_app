# == Schema Information
#
# Table name: user_books
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  user_id    :integer
#  status     :integer
#  parent     :boolean          default(FALSE), not null
#  child      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
end
