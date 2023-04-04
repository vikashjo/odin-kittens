class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
			
			render json: @kittens
	end

	def show
		@kitten = set_kitten
		render json: @kitten
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)

		respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: 'Kitten was successfully created.' }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def set_kitten
		@kitten = Kitten.find(params[:id])
	end

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
