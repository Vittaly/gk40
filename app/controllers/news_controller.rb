# -*- encoding : utf-8 -*-
class NewsController < ApplicationController
	def index
		@last_3news = News.last(3)
		@news = News.paginate(page: params[:page])
	end
	def show
		@news = News.find params[:id]
	end
	def new
		@news = News.new
	end

	def create
		@news = News.new(params[:news])
		if @news.save
			flash[:success] = 'Новость сохранена успешна!'
			redirect_to @news
		else
			flash.now[:error] = @news.errors.full_messages.to_sentence 
			render 'new'
		end
	end

	def edit
		@news = News.find params[:id]
		if @news.save
			flash[:success] = 'Новость успешно изменена!'
			redirect_to @news
		end
	end

	def destroy
	end
end
