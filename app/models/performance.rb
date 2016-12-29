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

  validates :comment,
    length: { maximum: 140 }
  enum evaluate: { very_good: 3, good: 2, bad: 1, very_bad: 0 }

end
