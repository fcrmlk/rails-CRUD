class AuthorsController < ApplicationController
  
  def index
  	@authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.name = params[:author][:name]
    @author.age = params[:author][:age]
    @author.city = params[:author][:city]
    @author.postal = params[:author][:postal]
    @author.save
    redirect_to author_path(@author)
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
  	
    @user = Author.new
    @user.name = params[:author][:name]
    @user.age = params[:author][:age]
    @user.city = params[:author][:city]
    @user.postal = params[:author][:postal]
    @user.save
    redirect_to authors_path
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

end