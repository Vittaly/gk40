# -*- encoding : utf-8 -*-
class ApartmentsController < ApplicationController
	def index
		redirect_to signin_path unless signed_in?
		@apartments = Apartment.all :order => "apartment_number ASC"
	end
end
