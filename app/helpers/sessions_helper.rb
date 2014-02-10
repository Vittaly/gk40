# -*- encoding : utf-8 -*-
module SessionsHelper
	 def sign_in(user)
   session[:current_user_id] = user.id
   session[:expires_at] = 1.minutes.from_now
    self.current_user = user
  end
  def signed_in?
  	  !current_user.nil?
  end
  def current_user=(user)
    @current_user = user
  end

  def current_user
  	  flash.now[:notice] = session[:expires_at]
	  #debugger
  	  if (!session[:expires_at]) || session[:expires_at] < Time.now then
  	  	  sign_out
		  return nil
  	  else
  	  	  session[:expires_at] = 1.minutes.from_now
  	  end
  	  @current_user ||= User.find session[:current_user_id] if session[:current_user_id]
  	  @current_user
  end

  def sign_out
    self.current_user = nil
    session[:current_user_id] = nil
     session[:expires_at] = nil
  end
end
