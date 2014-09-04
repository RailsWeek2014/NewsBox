class NewsmessagesController < ApplicationController
	def index
		@newsmessage = Newsmessage.all
	end

	def new
		@newsmessage = Newsmessage.new
	end

	def delete
	end

	def create
		@newsmessage = Newsmessage.new(newsmessage_params)
		@newsmessage.save
		redirect_to newsmessages_path
	end

	private
	def newsmessage_params
		params.require('newsmessage').permit('title','url','comment','image')
	end
end
