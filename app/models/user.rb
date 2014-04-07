class User < ActiveRecord::Base
	has_many :posts
	has_many :comments_received, through: :posts, source: :comments
	has_many :comments_written, class_name: "Comment"

	#VALIDATIONS
	validates_uniqueness_of :email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates_presence_of :email, :name

	#bcrypt stuff
	has_secure_password
end
