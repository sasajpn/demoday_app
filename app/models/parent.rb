# == Schema Information
#
# Table name: parents
#
#  id             :integer          not null, primary key
#  book_id        :integer
#  deadline       :datetime
#  status         :integer          default(0), not null
#  address_id     :integer
#  children_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Parent < ActiveRecord::Base
  has_many :children, dependent: :destroy

  has_one :parent_child
  has_one :child, through: :parent_child

  belongs_to :book
  delegate :title, :author, :image, :exchange_times, to: :book
  has_one :user, through: :book

  scope :within_deadline, -> { where('deadline > ?', Time.now()) }
  scope :without_deadline, -> { where('deadline < ?', Time.now()) }
  scope :not_mine, ->(user) { where.not(book_id: user.books) }
  scope :until_trading, -> { joins(:parent_child).merge(ParentChild.where(done: false)) }
  # scope :want, ->(user) { joins(:children).where(book_id: user.books) }

  after_update :trading_done
  after_update :create_performance
  after_update :exchange_book

  def trading_done
    parent_child.update(done: true) if status > 3 && child.status > 3
  end

  def create_performance
    if status == 3 && child.status == 3
      Performance.create(user_id: user.id, book_id: book.id)
      Performance.create(user_id: child.user.id, book_id: child.book.id)
    end
  end

  def exchange_book
    if status == 3 && child.status == 3
      book.update(user_id: child.user.id)
      child.book.update(user_id: parent.user.id)
    end
  end
end
