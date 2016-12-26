require "#{Rails.root}/app/models/parent.rb"

class Tasks::DestroyParents
  def self.execute
    Parent.without_deadline.destroy_all
  end
end
