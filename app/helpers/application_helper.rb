module ApplicationHelper

  # devise

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  # book

  def book_form_url
    if controller.action_name == 'edit'
      (@book)
    elsif controller.action_name == 'new'
      [ current_user, @book ]
    end
  end

  # parent

  # parent_children

  def message_form_url
    if controller.action_name == 'edit'
      (@message)
    elsif controller.action_name == 'new'
      [ parent_child, message ]
    end
  end

  def partner(parent_child)
    if parent_child.parent.user == current_user
      parent_child.child.user.id
    else
      parent_child.parent.user.id
    end
  end

  # animal
  def user_icon(animal)
    case
    when animal.include?("チーター")
      'Cheetah.png'
    when animal.include?("たぬき")
      'Raccoon.png'
    when animal.include?("猿")
      'Monkey.png'
    when animal.include?("コアラ")
      'Koala.png'
    when animal.include?("黒ひょう")
      'Leopard.png'
    when animal.include?("虎")
      'Tiger.png'
    when animal.include?("こじか")
      'Deer.png'
    when animal.include?("ゾウ")
      'Elephants'
    when animal.include?("狼")
      'Wolf.png'
    when animal.include?("ひつじ")
      'Sheep'
    when animal.include?("ペガサス")
      'Pegasus.jpg'
    when animal.include?("ライオン")
      'Lion.png'
    end
  end

  def step_navs(parent, child)
    if parent.status == 0 || child.status == 0
      render partial: "step1_navs"
    elsif parent.status == 1 || child.status == 1
      render partial: "step2_navs"
    elsif parent.status == 2 || child.status == 2
      render partial: "step3_navs"
    elsif parent.status == 3 || child.status == 3
      render partial: "step4_navs"
    end
  end

end
