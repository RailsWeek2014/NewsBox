class FeedEntriesController < ApplicationController
	def index
		#listener = Listener.all.map(&:url)
		#FeedEntry.update_from_feed(listener)
		@q = FeedEntry.search(params[:q])
		@q.sorts = 'published_at desc'
		@feed_entries = @q.result
	end

	def redirect 
		@feed_entry = FeedEntry.find(params[:feed_entry_id])
		@feed_entry.update_column(:new, false)
		redirect_to @feed_entry.url
	end

	def show
		@feed_entry = FeedEntry.find(params[:id])
	end

	def destroy
		@feed_entry = FeedEntry.find(params[:id])
		@comments = Comment.where(feed_entry_id: @feed_entry.id)
		@comments.each do |d|
			d.destroy
		end
		@feed_entry.destroy
		redirect_to feed_entries_path, notice: "Feed #{@feed_entry.name} wurde erfolgreich gelöscht."
	end
end
