class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
  def new
  end

  def create
  	user = User.find_by name: params[:session][:name].downcase
  	if user && user.authenticate(params[:session][:password])
  		#TODO save user infor into session
  		flash[:success] = "Login success"
  		log_in user
  		redirect_to user
  	else
  		flash[:danger] = "Invalid username/password combination"
  		render :new
  	end
  end

  def destroy
  	log_out
  	flash[:success] = "Your are logged out"
  	redirect_to login_path
  end
end
