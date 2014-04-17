class Category < ActiveRecord::Base
	# has_and_belongs_to_many :posts
	has_many :accusers
	has_many :accuseds
	has_many :posts, through: :accusers, source: :posts
	
end
