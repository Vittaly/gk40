# -*- encoding : utf-8 -*-
class MonthlyReadingsController < ApplicationController
	def edit
		@monthly_reading = MonthlyReading.find params[:id]
		session[:return_to] = request.referer
	end
	def update
		@monthly_reading = MonthlyReading.find params[:id]
		if @monthly_reading.update_attributes(params[:monthly_reading])
			redirect_to(session.delete(:return_to))
		else
			render :edit
		end
	end;
end
