module FeedEntriesHelper
	def entry_new?
		nil
	end

	def count_comments entry
		Comment.where(feed_entry_id: entry.id).count
	end
end
