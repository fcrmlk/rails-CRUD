class DepartmentsController < ApplicationController
	
	protect_from_forgery with: :null_session
	before_action :find_author_for_department, only: [:index, :create, :edit, :show, :destroy]
	def index
		@department = @author.department
		# @departments = Department.all
	end
	def new
		@department = Department.new
	end
	def create
		@department = Department.new(strong_params_for_department)
		@department.author_id = @author_id
		if @department.save!
			redirect_to author_department_path
		else
			render 'new'
		end
	end

	def edit
		@department = Department.find(params[:id])
	end

	def update
		@department = Department.find(params[:id])
		if @book.update(strong_params_for_department)
			redirect_to author_department_path(@department)
		else
			render 'edit'
		end
		
	end

	def show
		@department = @author.department
	end

	def destroy
		department = @author.departments
		if department.destroy
			redirect_to author_departments_path
		else
			render 'show'
		end
		
	end

	private
	def find_author_for_department
		@author = Author.find(params[:author_id])
	end

	def strong_params_for_department
		params.require(:department).permit(:name, :code, :block)
	end

end
