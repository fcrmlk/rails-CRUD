class BooksController < ApplicationController

	before_action :find_author_for_book, only: [:index, :new, :create, :edit, :show, :destroy]

	def index
		@books = @author.books.all
	end

	def new
		@book = Book.new
	end

	def show
		@book = @author.books.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.new(strong_params_for_book)
		@book.author_id = @author.id
		if @book.save!
			redirect_to author_books_path
		else
			render 'new'
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(strong_params_for_book)
			redirect_to author_book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		book = @author.books.find(params[:id])
		if book.destroy
			redirect_to author_books_path
		else
			render 'show'
		end
	end

	private
	def find_author_for_book
		@author = Author.find(params[:author_id])
	end

	def strong_params_for_book
		params.require(:book).permit(:name, :price, :description)
	end

end