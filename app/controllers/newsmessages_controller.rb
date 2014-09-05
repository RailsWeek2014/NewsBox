class NewsmessagesController < ApplicationController
	def index
		@listener = Listener.all.map(&:url)
		urls = getListeners
		feeds = Feedjira::Feed.fetch_and_parse urls 
		@feed = feeds['http://www.ardmediathek.de/tv?rss']
	#	@feed = feeds['http://heise.de.feedsportal.com/c/35207/f/653901/index.rss']
	end

	def new
		@newsmessage = Newsmessage.new
	end

	def delete
	end

	def create
		@newsmessage = Newsmessage.new(newsmessage_params)
		@newsmessage.save
		redirect_to newsmessages_path
	end

	private
	def newsmessage_params
		params.require('newsmessage').permit('title','url','comment','image')
	end

	def getListeners
		%w[http://gdata.youtube.com/feeds/base/users/gronkh/uploads?v=2&alt=rss&client=ytapi-youtube-rss-redirect&orderby=updated
				http://heise.de.feedsportal.com/c/35207/f/653901/index.rss
				http://www.ardmediathek.de/tv?rss]
	end

end
