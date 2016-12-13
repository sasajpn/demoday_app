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

  def partner(parent_child)
    if parent_child.parent.user == current_user
      parent_child.child.user.id
    else
      parent_child.parent.user.id
    end
  end

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


  def us_icon(animal)
    case animal.include?("s")
    when 1, 7, 42, 48
      ('Cheetah.png')
    when 2, 8, 41, 47
      ('Raccoon.png')
    when 3, 9, 15, 34, 40, 46
      ('Monkey.png')
    when 4, 10, 16, 33, 39, 45
      ('Koala.png')
    when 5, 44, 50, 53, 56, 59
      ('Leopard.png')
    when 6, 43, 49, 54, 55, 60
      ('Tiger.png')
    when 11, 17, 32, 38
      ('Deer.png')
    when 12, 18, 31, 37
      ('Elephants')
    when 13, 19, 24, 25, 30, 36
      ('Wolf.png')
    when 14, 20, 23, 26, 29, 35
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
