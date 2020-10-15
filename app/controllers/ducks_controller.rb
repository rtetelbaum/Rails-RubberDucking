class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

	def show
		find_duck
	end

	def new
		@duck = Duck.new
		@students = Student.all
	end

	def create
		@duck = Duck.new(duck_params)
		if @duck.save
			redirect_to duck_path(@duck)
		else
			flash[:errors] = @duck.errors.full_messages
			redirect_to new_duck_path
		end
	end

	def edit
		find_duck
		@students = Student.all
	end

	def update
		find_duck
		if @duck.update(duck_params)
			redirect_to duck_path(@duck)
		else
			flash[:errors] = @duck.errors.full_messages
			redirect_to edit_duck_path
		end
	end

	private

	def duck_params
		params.require(:duck).permit(:name, :description, :student_id)
	end

	def find_duck
		@duck = Duck.find(params[:id])
	end

end
