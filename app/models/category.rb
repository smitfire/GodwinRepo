class Category < ActiveRecord::Base
	# has_and_belongs_to_many :posts
	has_many :accusers
	has_many :accuseds
	has_many :accuser_posts, through: :accusers, source: :posts
	has_many :accused_posts, through: :accuseds, source: :posts
	
end
