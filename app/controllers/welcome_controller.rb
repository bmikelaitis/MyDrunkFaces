class WelcomeController < ApplicationController
  def index
    redirect_to faces_path if logged_in?
  end

end
