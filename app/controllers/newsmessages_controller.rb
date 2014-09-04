class NewsmessagesController < ApplicationController
	def index
		@newsmessage = Newsmessage.all
	end

	def edit

	end

	def new
		@newsmessage = Newsmessage.new
	end

	def delete
		
	end

	def update
		
	end

	def create
		@newsmessage = Newsmessage.new(newsmessage_params)
	end
	

	private
	def newsmessage_params
		params.require('newsmessage').permit('title','url','comment')
	end

end
