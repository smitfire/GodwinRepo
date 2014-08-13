class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :accuser
	belongs_to :accused
	has_many :comments
	has_many :likes
	has_many :likers, through: :likes, source: :user

	
	has_and_belongs_to_many :tags
      # accepts_nested_attributes_for :accuser, :accused
	# has_and_belongs_to_many :categories

end
