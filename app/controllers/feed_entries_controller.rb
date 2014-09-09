class FeedEntriesController < ApplicationController
	def index
		#listener = Listener.all.map(&:url)
		#FeedEntry.update_from_feed(listener)
		@q = FeedEntry.search(params[:q])

		@feed_entries = @q.result
		#@feed_entries = FeedEntry.order('published_at desc')
	end

	def create
		
	end
end
