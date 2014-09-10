class Listener < ActiveRecord::Base
	has_many :feed_entrys
	belongs_to :user
	validates :title, presence: true
	validates :url, presence: true
end
