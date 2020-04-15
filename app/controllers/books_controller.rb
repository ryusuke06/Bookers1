class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path, notice: "Book was successfully destroyed."
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book), notice: "Book was successfully created."
    else
      redirect_to books_path, flash: { error: book.errors.full_messages }
    end
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  	  redirect_to book_path(book), notice: "Book was successfully updated."
    else
      redirect_to edit_book_path, flash: { error: book.errors.full_messages }
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
