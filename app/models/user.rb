class User < ActiveRecord::Base
	has_many :posts
	has_many :comments_received, through: :posts, source: :comments
	has_many :comments_written, class_name: "Comment"
end
