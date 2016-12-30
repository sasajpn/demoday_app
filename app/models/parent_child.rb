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
  delegate :status, to: :parent, prefix: :parent
  belongs_to :child
  delegate :status, to: :child, prefix: :child

  after_create :destroy_children_of_parent

  def destroy_children_of_parent
    @children = parent.children.where.not(id: child)
    @children.destroy_all
  end

  def update_status(user)
    parent.update(status: 5) if user == parent.user
    child.update(status: 5) if user == child.user
  end
end
