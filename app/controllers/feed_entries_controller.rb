class FeedEntriesController < ApplicationController
	def index
		listener = Listener.all.map(&:url)
		FeedEntry.update_from_feed(listener)
		@feed_entries = FeedEntry.order('published_at desc')
	end

	def create
		
	end
end
