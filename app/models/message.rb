class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent_child
end
