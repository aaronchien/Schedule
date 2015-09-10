class Event < ActiveRecord::Base
	belongs_to :calendar
	belongs_to :user

	validates :name, presence:true
	validates :date, presence:true
	validates :time, presence:true
	validates :location, presence:true
end
