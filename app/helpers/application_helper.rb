module ApplicationHelper
def signed_in?
       if session[:user_id].nil?
			return
       else
			@current_user = User.find_by_id(session[:user_id])
       end
  end
  
  def euro(amount)
	number_to_currency(amount, :unit => "&euro;")
	end
end
