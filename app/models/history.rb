class History < ActiveRecord::Base
  belongs_to :book
  belongs_to :prefecture
end
