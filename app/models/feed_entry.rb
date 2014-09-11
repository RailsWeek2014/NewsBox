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
		feed_old
	end

	def self.update_from_feed_continously(delay_interval = 30.minutes)
		loop do 
			update_from_feed(Listener.all.map(&:url))
			sleep delay_interval
		end
	end

	def self.remove_from_feed(listener)
		feeds = FeedEntry.select(:id).where.not(id: (Comment.select(:feed_entry_id).distinct))
		where(listener_id: listener.id, id: feeds).delete_all
	end

	def self.feed_old
		FeedEntry.all.each do |feed_entry|
			if Comment.where(feed_entry_id: feed_entry.id).count > 0
				if feed_entry.published_at > 3.month.ago
					feed_entry.destroy
				end	
			end
		end
	end


	private

	def self.add_entries(entries, listener)
		entries.each do |entry|
			if entry.published > 3.month.ago
				if include_any?(entry.title, listener.tags.split(/, /))|| listener.tags.empty?
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
				        user = User.find(listener.user_id)
				        UserMailer.send_rss(entry, user.email) 
			    	end
			    end
			end
	    end
	end

	def self.include_any? (title, array)
		array.each do |element|
			if title.downcase.include? element.downcase
				return true
			end
		end
		false
	end
end
