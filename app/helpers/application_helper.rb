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

  def add_active(num)
    "active" if num == 1
  end

  def add_style1(num)
    "position: relative; height: 1070px;" if num == 1
  end

  def add_style2(num)
    "position: absolute; left: 0px; top: 0px;" if num == 1
  end
  
  # parent

  # parent_children

  def partner(parent_child)
    if parent_child.parent.user == current_user
      parent_child.child.user.id
    else
      parent_child.parent.user.id
    end
  end

  # address

  def new_or_edit
    case controller.action_name
    when "new"
      "お届け先の登録"
    when "edit"
      "お届け先の変更"
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
end
