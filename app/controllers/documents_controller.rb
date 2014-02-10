# -*- encoding : utf-8 -*-
class DocumentsController < ApplicationController
	def index
	check_sign_in
	@documents = Document.paginate(page: params[:page])
	end
	
	def download
		check_sign_in
		@docum = Document.find(params[:id])
	send_file(@docum.doc.path, disposition: 'attachment', type: @docum.doc_content_type)
	end
	
	def new
		check_admin
		@document = Document.new
	end

	def create
		return if !check_admin
		@document = Document.new(params[:document])
		if @document.save
			flash[:success] = 'Документ сохранено успешно!'
			redirect_to documents_path
		else
			flash.now[:error] = @document.errors.full_messages.to_sentence
			render 'new'
		end
	end
	def destroy
		check_admin
		@doc = Document.find(params[:id])
		if @doc.destroy
			flash[:success] = 'Документ '+@doc.title+ 'удален.'
			redirect_to documents_path
		else
			flash[:error] = @document.errors.full_messages.to_sentence
			redirect_to documents_path
		end
	end
	private
	def check_sign_in
		return true if signed_in?
		redirect_to root_path
		return false
		
	end
	def check_admin
	    return true if (current_user && current_user.isAdmin?)
		redirect_to documents_path
		return false
	end
end
