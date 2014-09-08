class ListenersController < ApplicationController
	def index
		@listeners = Listener.all
	end

	def new 
		@listener = Listener.new
	end

	def create
		@listener = Listener.new(listener_params)
		if @listener.save
		redirect_to newsmessages_path
		else
			render action: "new"
		end
	end

	def edit
		@listener = Listener.find(params[:id])
	end

	def update
		@listener = Listener.find(params[:id])
		if @listener.update_attributes(listener_params)
			redirect_to listeners_path
		else
			render action: "edit"
		end		
	end

	def destroy
        @listener = Listener.find(params[:id])
        @listener.destroy
        redirect_to listeners_path
    end
    
private
	def listener_params
		params.require('listener').permit('title','url','comment','image','tags')
	end

end
