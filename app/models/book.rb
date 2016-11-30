# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  author     :string(255)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
  has_one :parent, dependent: :destroy
  has_one :child, dependent: :destroy

  belongs_to :user

  enum status: { very_good: 3, good: 2, bad: 1, very_bad: 0 }

  validates :title, :author,
    presence: true

  validates :user_id,
    uniqueness: {
      scope: [ :title, :author ],
      message: "その本はすでに登録しています" }

  def already_negotiate?
    parent.present? && child.present?
  end

end
