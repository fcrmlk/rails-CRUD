class AuthorsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_record_from_database, only: [:edit, :show, :destroy, :update]

  def index
  	@authors = Author.all
  end

  def new
    
    @author = Author.new
  end

  def edit
  end

  def update
    @author.update(strong_params_for_author)
    @author.save
    redirect_to author_path(@author)
  end

  def show
  end

  def create

    @user = Author.new(strong_params_for_author)
    @user.save
    redirect_to authors_path
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  def find_record_from_database
    @author = Author.find(params[:id])
  end

  def strong_params_for_author
    params.require(:author).permit(:name, :age, :city, :postal)
  end

end