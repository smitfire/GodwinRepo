class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :likes

	has_and_belongs_to_many :tags
	# has_and_belongs_to_many :categories
end
