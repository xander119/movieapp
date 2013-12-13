class User < ActiveRecord::Base
has_secure_password
has_many :posts, :dependent=> :destroy

	validates_presence_of :password
	validates_presence_of :email
	validates_presence_of :name
	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	
	
	def self.setRegular(user)
		unless user.nil?
			if user.posts.count >= 3
				user.regular = true
				user.save
			end
		end
	end
	
	
	
end