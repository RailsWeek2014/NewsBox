# Source http://railscasts.com/episodes/168-feed-parsing

class FeedEntry < ActiveRecord::Base
	belongs_to :listener
	has_many :comments

	def self.update_from_feed(feed_url)
		feeds = Feedjira::Feed.fetch_and_parse(feed_url)
		feed_url.each do |d|
			listener = Listener.find_by(url: d)
			feed = feeds[d]
			add_entries(feed.entries, listener)
		end
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

	def self.remove_from_feed(listener)
		feeds = FeedEntry.select(:id).where.not(id: (Comment.select(:feed_entry_id).distinct))
		remove_entries(listener, feeds)
	end

	private

	def self.add_entries(entries, listener)
		entries.each do |entry|
			if include_any? entry.title, listener.tags.split(/, /)
		    	unless exists? :guid => entry.id 
		        create!(
		          :name         => entry.title,
		          :summary      => entry.summary,
		          :url          => entry.url,
		          :published_at => entry.published,
		          :guid         => entry.id,
		          :listener_id	=> listener.id,
		          :image        => listener.image,
		          :new          => true
		        )
		    	end
		    end
	    end
	end

	def self.include_any? (title, array)
		array.each do |element|
			if title.include? element
				return true
			end
		end
		false
	end

	def self.remove_entries(listener , feeds)
		where(listener_id: listener.id, id: feeds).delete_all
	end
end
