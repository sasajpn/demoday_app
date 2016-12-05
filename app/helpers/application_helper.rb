module ApplicationHelper
  def form_url
    if controller.action_name == 'edit'
      (@book)
    elsif controller.action_name == 'new'
      [ @user, @book ]
    end
  end
end
