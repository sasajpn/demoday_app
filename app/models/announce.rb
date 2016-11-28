# == Schema Information
#
# Table name: announces
#
#  id           :integer          not null, primary key
#  user_book_id :integer
#  start_day    :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Announce < ActiveRecord::Base
  belongs_to :user_book
end
