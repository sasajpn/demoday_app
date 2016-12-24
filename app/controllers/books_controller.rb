class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:destroy]
  before_action :user_check, except: [:destroy]
  before_action :negotiate_now, only: [:destroy]

  def new
    @books = []
    if params[:keyword].present?
      Amazon::Ecs.debug = true
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index: 'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country: 'jp',
        power: "Not kindle"
      )
      books.items.each do |item|
        book = current_user.books.build(
          title: item.get('ItemAttributes/Title'),
          author: item.get('ItemAttributes/Author'),
          image: item.get('LargeImage/URL')
        )
        @books << book
      end
    end
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to user_url(current_user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image, :status, :user_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def user_check
    @user = User.find(params[:user_id])
    redirect_to user_url(current_user) if @user != current_user
  end

  def negotiate_now
    @book = Book.find(params[:id])
    redirect_to user_url(current_user) if @book.already_negotiate?
  end
end
