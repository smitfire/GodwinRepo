class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :comments_received, through: :posts, source: :comments
	has_many :likes
	has_many :liked_posts, through: :likes, source: :post
	has_many :post_likes_received, through: :posts, source: :likes
	has_many :comment_likes_received, through: :comments, source: :likes
	has_many :authorizations

	#VALIDATIONS
	# validates_uniqueness_of :email
	# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates_presence_of :name

	#bcrypt stuff
	has_secure_password

  	def add_provider(auth_hash)
  	  unless authorizations.find_by(provider:auth_hash["provider"], uid: auth_hash["uid"])
  	    Authorization.create!(user: self, provider: auth_hash["provider"], uid: auth_hash["uid"])
  	  end
  	end

	def total_likes_given
		# self.comment_likes_given +  self.post_likes_given
	end

	def total_likes_received
		self.comment_likes_received.count +  self.post_likes_received.count
	end

	def total_comments_received
	end

	def total_likers

	end

	def rand_date(days)
  		rand(days).days.ago(Date.today)
	end

end
