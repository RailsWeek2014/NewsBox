# Source http://railscasts.com/episodes/168-feed-parsing

class FeedEntry < ActiveRecord::Base
	def self.update_from_feed(feed_url)
		feed = Feedjira::Feed.fetch_and_parse(feed_url)
		add_entries(feed.add_entries)
	end

	def self.update_from_feed_continously(feed_url, delay_interval = 15.minutes)
		feed = Feedjira::Feed.fetch_and_parse(feed_url)
		add_entries(feed.entries)
		loop do 
			sleep delay_interval
			feed = Feedjira::Feed.update(feed)
			add_entries(feed.new_entries) if feed.update?
		end
	end

	private

	def self.add_entries(entries)
		entries.each do |entry|
	    	unless exists? :guid => entry.id
	        create!(
	          :name         => entry.title,
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id
	        )
	    	end
	    end
	end
end
