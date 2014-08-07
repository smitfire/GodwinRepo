class Accuser < ActiveRecord::Base
	# belongs_to :post
	has_many :posts
	belongs_to :category
end