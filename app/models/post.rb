class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	# has_many :post_tags
	# has_many :tags, :through => :post_tags
	has_and_belongs_to_many :tags
end
