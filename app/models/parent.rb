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
  
  has_one :parent_child, dependent: :destroy
  has_one :child, through: :parent_child
  has_one :child_book, through: :child, source: :book
  delegate :title, to: :child_book, prefix: :child_book
  has_one :partner, through: :child_book, source: :user
  delegate :username, to: :partner, prefix: :partner

  belongs_to :book
  delegate :title, :author, :image, :exchange_times, to: :book
  has_one :user, through: :book

  scope :within_deadline, -> { where('deadline > ?', Time.now()) }
  scope :without_deadline, -> { where('deadline < ?', Time.now()) }
  scope :not_mine, ->(user) { where.not(book_id: user.books) }
  scope :until_trading, -> { joins(:parent_child).merge(ParentChild.where(done: false)) }

  after_update :trading_done
  after_update :create_performance
  after_update :create_history
  after_update :exchange_book

  def trading_done
    parent_child.update(done: true) if status > 3 && child.status > 3
  end

  def create_performance
    if status == 4 && child.status == 4
      Performance.create(user_id: user.id, book_id: book.id)
      Performance.create(user_id: child.user.id, book_id: child.book.id)
    end
  end

  def create_history
    if status == 4 && child.status == 4
      History.create(book_id: book.id, exchange_id: child.book.id, prefecture: Address.find(child.address_id).prefecture)
      History.create(book_id: child.book.id, exchange_id: book.id, prefecture: Address.find(address_id).prefecture)
    end
  end

  def exchange_book
    if status == 4 && child.status == 4
      book.update(user_id: child.user.id)
      child.book.update(user_id: parent.user.id)
    end
  end
end
