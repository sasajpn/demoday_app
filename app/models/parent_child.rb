# == Schema Information
#
# Table name: parent_children
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  child_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ParentChild < ActiveRecord::Base
  has_one :message

  belongs_to :parent
  belongs_to :child

  after_create :destroy_children_of_parent
  after_update :book_exchanged

  def destroy_children_of_parent
    @children = parent.children.where.not(id: child)
    @children.destroy_all
  end

  def book_exchanged
    if parent_done == true && child_done == true
      parent.book.update(exchange: true)
      child.book.update(exchange: true)
    end
  end

end
