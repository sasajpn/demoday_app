# == Schema Information
#
# Table name: announces
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  start_dat  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announce < ActiveRecord::Base
  belongs_to :book
end