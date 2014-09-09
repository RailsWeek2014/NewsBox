class FeedEntriesController < ApplicationController
	def index
		listener = Listener.all.map(&:url)
		FeedEntry.update_from_feed(listener)
	end

	def create
		
	end
end
