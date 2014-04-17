class User < ActiveRecord::Base
	has_many :posts
	# has_many :comments_received, through: :posts, source: :comments
	has_many :comments
	has_many :likes


	#VALIDATIONS
	validates_uniqueness_of :email
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates_presence_of :email, :name

	#bcrypt stuff
	has_secure_password

	def total_likes_given
		# self.comment_likes_given +  self.post_likes_given
	end

	def total_likes_received
		# self.comment_likes_received +  self.post_likes_received		
	end

	def total_likers


	end
end
