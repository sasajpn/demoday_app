# == Schema Information
#
# Table name: parents
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  deadline   :datetime
#  status     :integer          default(0), not null
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Parent < ActiveRecord::Base
  has_many :children

  has_one :parent_child

  belongs_to :book
  delegate :title, :author, :image, :exchange, to: :book
  has_one :user, through: :book

  scope :within_deadline, -> { where('deadline > ?', Time.now()) }
  # scope :want, ->(user) { joins(:children).where(book_id: user.books) }

  after_update :book_exchanged

  def book_exchanged
    if status > 3
      book.update(exchange: true)
    end
  end
end
