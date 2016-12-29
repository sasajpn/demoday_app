# == Schema Information
#
# Table name: performances
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  evaluator  :integer
#  evaluate   :integer
#  comment    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Performance < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  delegate :title, :author, :image, to: :book
end
