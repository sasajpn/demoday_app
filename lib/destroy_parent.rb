class Parent
  def self.destroy
    parents = Parent.where('deadline > ?', Time.now())
    parents.each so |parent|
      if parent.children.blank? || parent.parent_child.nil?
        parant.destroy
      end
    end
  end
end
