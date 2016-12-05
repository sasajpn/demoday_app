module ApplicationHelper
  def book_form_url
    if controller.action_name == 'edit'
      (@book)
    elsif controller.action_name == 'new'
      [ @user, @book ]
    end
  end

  def message_form_url
    if controller.action_name == 'edit'
      (@message)
    elsif controller.action_name == 'new'
      [ parent_child, message ]
    end
  end
end
