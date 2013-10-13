# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
	def new
		 render 'new'
	end

	def create
		user = User.find_by_Account params[:session][:Account]
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Не верный Логин или пароль'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
	
end
