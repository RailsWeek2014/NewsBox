namespace :autoupdate do
	desc "Feed autoupdate"
	task feed: :environment do
		FeedEntry.update_from_feed_continously
	end
end
