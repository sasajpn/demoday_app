# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  parent_id  :integer
#  recommend  :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Child < ActiveRecord::Base
  belongs_to :book
  belongs_to :parent
end
