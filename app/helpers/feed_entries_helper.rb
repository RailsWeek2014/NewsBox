module FeedEntriesHelper
	def image_finder text
		nil
	end

	def count_comments entry
		Comment.where(feed_entry_id: entry.id).count
	end
end
