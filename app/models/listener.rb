class Listener < ActiveRecord::Base
	has_many :feed_entrys
	validates :title, presence: true
	validates :url, presence: true
end
