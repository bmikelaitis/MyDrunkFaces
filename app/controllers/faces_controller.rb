class FacesController < ApplicationController
    
    def index
        @faces = Face.all
    end
    
    def show
    @face = Face.find(params[:id])
    end
    
    def new
    @face = Face.new
    end
    
    def create

		@face = Face.new(face_params)
		@face.user = User.find(1)

		if @face.save
			flash[:success] = "Your face was submitted successfully!"
			redirect_to faces_path

		else
			render :new
		end
    end
    
    def edit
        @face = Face.find(params[:id])
    end
    
    def update
        @face = Face.find(params[:id]) 

		if @face.update(face_params)
			flash[:success] = "Your face was updated successfully!"
			redirect_to faces_path(@face)
        else
			render :edit
		end
    end
	
	private
	    def face_params
	    	params.require(:face).permit(:picture, :description)
	    end
end