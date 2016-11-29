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
end
