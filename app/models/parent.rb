# == Schema Information
#
# Table name: parents
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  deadline   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Parent < ActiveRecord::Base
  belongs_to :book
end
