class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :cretate, :edit, :update, :destroy]
  before_action :set_user

  def index
  end

  def show
  end

  def new
    @book = @user.books.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def set_user
    @user = current_user
  end
end
