class ListenersController < ApplicationController
	def index
		@listener = Listener.all
	end

	def new 
		@listener = Listener.new
	end

	def create
		@listener = Listener.new(listeners_params)
		@listener.save
		redirect_to newsmessages_path
	end

	private
	def listeners_params
		params.require('listener').permit('title','url','comment','image','tags')
	end


end
