class LoginsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			flash[:success] = "You are Logged In!"
			redirect_to faces_path
			session[:user_id] = chef.id
		else
			flash.now[:danger] = "Your email address or password does not match."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end