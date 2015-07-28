class UsersController < ApplicationController 
	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@users = User.paginate(page: params[:page], per_page: 3)
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Your account has been created succesfully"
			session[:user_id] = @user.id
			redirect_to faces_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account has been updated succesfully"
			redirect_to faces_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@faces = @user.faces.paginate(page: params[:page], per_page: 3).order("updated_at DESC")

	end

	private
	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :state, :college, :password, :birthday, :avatar)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:danger] = "You can only edit your own profile"
			redirect_to root_path
		end
	end
end