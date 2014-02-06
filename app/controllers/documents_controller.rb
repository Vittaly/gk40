# -*- encoding : utf-8 -*-
class DocumentsController < ApplicationController
def index
@documents = Document.paginate(page: params[:page])
end
def download
@docum = Document.find(params[:id])
send_file(@docum.doc.path, disposition: 'attachment', type: @docum.doc_content_type)
end
def new
		@document = Document.new
	end

	def create
		@document = Document.new(params[:document])
		if @document.save
			flash[:success] = 'Документ сохранено успешно!'
			redirect_to documents_path
		else
			flash.now[:error] = @document.errors.full_messages.to_sentence 
			render 'new'
		end
	end
end
