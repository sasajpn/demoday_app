class PageController < ApplicationController

  def top
    @parent = ParentChild.where(parent_confirm: true, child_confirm: true).sample(3)
  end
end
