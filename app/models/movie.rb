class Movie < ActiveRecord::Base
	belongs_to :genre
	has_many :posts, :dependent=> :destroy
	
	def self.search(search)
   search_condition = search + "%"
   find(:all, :conditions => ['title LIKE  ?', search_condition])
end

	def must_be_valid_trailer
	unless trailer.include?("<iframe")
	errors.add(:trailer,"Invalid trailer link")
	end

	def discount
		self.price = self.price - self.price*0.10
	end
end
end