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
  belongs_to :parent
  belongs_to :child

  after_create :destroy_children_of_parent

  def parent_status
    parent.status
  end

  def child_status
    child.status
  end

  def destroy_children_of_parent
    @children = parent.children.where.not(id: child)
    @children.destroy_all
  end

  def update_status(user)
    if user == parent.user
      parent.update(status: 5)
    elsif user == child.user
      child.update(status: 5)
    end
  end
end
