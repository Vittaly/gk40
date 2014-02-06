# -*- encoding : utf-8 -*-
class AdsController < ApplicationController
	def index
		#	@last_3news = News.last(3)
		@news = News.paginate(page: params[:page])
	end
	def show
		@ad = Ad.find params[:id]
	end
	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.new(params[:ad])
		if @ad.save
			flash[:success] = 'Объявление сохранено успешно!'
			redirect_to @ad
		else
			flash.now[:error] = @ad.errors.full_messages.to_sentence 
			render 'new'
		end
	end
	def edit
		@ad = Ad.find params[:id]
		if @ad.save
			flash[:success] = 'Объявление успешно изменено!'
			redirect_to @ad
		end
	end
	def update
		@ad = Ad.find params[:id]
		if @ad.update_attributes(params[:ad])
			flash[:success] = 'Объявление успешно изменено!'
			redirect_to @ad
		end
	end
end
