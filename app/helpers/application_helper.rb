module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def book_form_url
    if controller.action_name == 'edit'
      (@book)
    elsif controller.action_name == 'new'
      [ current_user, @book ]
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
