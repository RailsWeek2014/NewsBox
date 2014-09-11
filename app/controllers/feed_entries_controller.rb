class FeedEntriesController < ApplicationController
	def index
		listener = Listener.all.map(&:url)
		FeedEntry.update_from_feed(listener, current_user)
		@q = FeedEntry.search(params[:q])
		@q.sorts = 'published_at desc'
		@feed_entries = @q.result
		#@feed_entries = FeedEntry.order('published_at desc')
	end

	def redirect 
		@feed_entry = FeedEntry.find(params[:feed_entry_id])
		@feed_entry.update_column(:new, false)
		redirect_to @feed_entry.url
	end

	def show
		@feed_entry = FeedEntry.find(params[:id])
	end

	def delete_feed
		FeedEntry.find(params[:id]).destroy
	end
end
