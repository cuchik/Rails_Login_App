class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:login, :create]

  def login
  end

  def create
  	user = User.find_by name: params[:session][:name].downcase
  	if user && user.authenticate(params[:session][:password])
  		#TODO save user infor into session
  		flash[:success] = "Login success"
  		log_in user
  		redirect_to dashboard_path
  	else
  		flash[:danger] = "Tên đăng nhập/mật khẩu không đúng, vui lòng thử lại!"
  		render :login
  	end
  end

  def destroy
  	log_out
  	flash[:success] = "Bạn đã đăng xuất, vui lòng đăng nhập lại!"
  	redirect_to login_path
  end
end
