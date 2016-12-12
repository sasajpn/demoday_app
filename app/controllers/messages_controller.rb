class MessagesController < ApplicationController
  before_action :set_parent_child
  before_action :parent_child_check

  def index
    @messages = @parent_child.messages
    @parent_user = @parent_child.parent.book.user
    @child_user = @parent_child.child.book.user
  end

  def create
    @message = @parent_child.messages.build(message_params)
    if @message.save
      redirect_to parent_child_messages_url(@parent_child)
    else
      render 'parent_child/index'
      @messages = @parent_child.messages
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to parent_child_messages_url(@parent_child)
    else
      render 'parent_child/index'
      @pmessages = @parent.child.messages
    end
  end

  def destroy
    @message.destroy
    redirect_to parent_child_messages_url(@parent_child)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :parent_child, :content)
  end

  def set_parent_child
    @parent_child = ParentChild.find(params[:parent_child_id])
  end

  def parent_child_check
    @parent_child = ParentChild.find(params[:parent_child_id])
    @parent_user = @parent_child.parent.book.user
    @child_user = @parent_child.child.book.user
    if @parent_user != current_user && @child_user != current_user
      redirect_to user_url(current_user)
    end
  end
end
