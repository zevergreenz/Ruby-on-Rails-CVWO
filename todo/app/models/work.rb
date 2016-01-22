class Work < ActiveRecord::Base

	validates :item, presence: true
	validates :tag, presence: true
	
	def self.search(query)
		where("tag like ?", "%#{query}%")
	end
end
