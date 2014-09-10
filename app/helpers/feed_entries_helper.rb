module FeedEntriesHelper
	def entry_older feed_entry
		if 3.days.ago > feed_entry.published_at
			feed_entry.new = false
		end
	end

	def count_comments entry
		Comment.where(feed_entry_id: entry.id).count
	end

	def search_comments entry
		Comment.where(feed_entry_id: entry.id)
	end
end
