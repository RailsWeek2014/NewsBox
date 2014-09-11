class ListenersController < ApplicationController
	def index
		@listeners = current_user.listeners
	end

	def new 
		@listener = Listener.new
	end

	def create
		@listener = Listener.new(listener_params)
		if @listener.save
			current_user.listeners << @listener
			redirect_to listeners_path,
			notice: "Favorit #{@listener.title}wurde erfolgreich angelegt."
		else
			render action: "new",
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
        FeedEntry.remove_from_feed(@listener)
        @listener.destroy
        redirect_to listeners_path, 
        notice: "Link #{@listener.title} wurde erfolgreich gelöscht."
    end

private
	def listener_params
		params.require('listener').permit('title','url','comment','image','tags')
	end

end
