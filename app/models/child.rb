# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  parent_id  :integer
#  recommend  :text(65535)
#  status     :integer          default(0), not null
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Child < ActiveRecord::Base
  has_one :parent_child, dependent: :destroy
  has_one :dealer, through: :parent_child, source: :parent

  belongs_to :book
  delegate :title, :author, :image, :exchange_times, to: :book
  has_one :user, through: :book

  belongs_to :parent, counter_cache: true
  has_one :parent_book, through: :parent, source: :book
  has_one :partner, through: :parent_book, source: :user

  validates :recommend,
    length: { maximum: 140 }
  # enum status: { negotiate: 0, confirm: 1, notice: 2, send: 3, recieve: 4 }

  scope :until_trading, -> { joins(:parent_child).merge(ParentChild.where(done: false)) }

  after_update :trading_done
  after_update :create_performance
  after_update :create_history
  after_update :exchange_book

  def trading_done
    parent_child.update(done: true) if status > 3 && dealer.status > 3
  end

  def create_performance
    if status == 4 && dealer.status == 4
      Performance.create(user_id: user.id, book_id: book.id)
      Performance.create(user_id: dealer.user.id, book_id: dealer.book.id)
    end
  end

  def create_history
    if status == 4 && dealer.status == 4
      History.create(book_id: book.id, exchange_id: dealer.book.id, prefecture: Address.find(dealer.address_id).prefecture)
      History.create(book_id: dealer.book.id, exchange_id: book.id, prefecture: Address.find(address_id).prefecture)
    end
  end

  def exchange_book
    if status == 4 && dealer.status == 4
      book.update(user_id: dealer.user.id)
      dealer.book.update(user_id: user.id)
    end
  end
end
