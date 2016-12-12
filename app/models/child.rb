# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  parent_id  :integer
#  recommend  :text(65535)
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Child < ActiveRecord::Base
  has_one :parent_child

  belongs_to :book
  has_one :user, through: :book
  belongs_to :parent

  # enum status: { negotiate: 0, confirm: 1, notice: 2, send: 3, recieve: 4 }

end
