class HistoriesController < ApplicationController
  before_action :set_book

  def index
    @histories = @book.histories
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
