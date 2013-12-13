class SessionsController < ApplicationController
  def new
	
  end

  def create
	user = User.find_by_name(params[:name])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect_to pages_home_path #session[:return_to] 
	else 
		flash.now[:error] = "Invalid name/password."
		render 'new'
  end
  end

  def destroy
	if signed_in?
		session[:user_id] = nil		
		session[:return_to] = pages_home_path
		else
		flash[:notice] = "You need to sign in first"
			end
			redirect_to signin_path
 end

def new

end

end
