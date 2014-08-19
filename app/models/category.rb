class Category < ActiveRecord::Base
	# has_and_belongs_to_many :posts
	has_many :accusers
	has_many :accuseds
	has_many :accuser_posts, through: :accusers, source: :posts
	has_many :accused_posts, through: :accuseds, source: :posts
	
    def total_posts
      self.accused_posts.length + self.accuser_posts.length
    end

    def freq_of_occurence
      self.total_posts / Post.count.to_f
    end

    def total_likes_accuser_posts
      count = 0
      self.accuser_posts.each do |post|
        count += post.likes.length
      end
      count
    end

    def total_likes_accused_posts
      count = 0
      self.accuser_posts.each do |post|
        count += post.likes.length
      end
      count
    end

    def total_likes
      self.total_likes_accused_posts + self.total_likes_accuser_posts
    end

    def total_comments
      count = 0
      self.accuser_posts.each do |post|
        count += post.comments.length
      end
      self.accused_posts.each do |post|
        count += post.comments.length
      end
      count
    end

    def comment_ratio
      (self.total_posts / Comment.count.to_f)*100
    end

    def like_ratio
      (self.total_posts / self.total_likes.to_f )
    end
    

    def self.build_json_res_for_cat_index
      my_hash = {stuff: []}
      self.all.each do  |category|
        my_hash[:stuff] << { 
          'State' => category.title, 
          "Total Posts"  => category.total_posts,
          "Ratio of Posts" => category.freq_of_occurence * category.total_posts,
          "Number of times Category is Accuser" => category.accuser_posts.count,
          "Number of times Category is Accused" => category.accused_posts.count
          # "NUmber of Likes for Category" => category.total_likes,
          # "Ratio of Comments on Category" => category.comment_ratio,
          # "Like Ratio " => category.like_ratio
        }
      end
      my_hash
    end

    def build_json_res_for_cat
      my_arr = []
      Category.all.each do |cat|
        my_arr << {
          'State' => cat.key,
          'freq' => {
            'accuser_posts' => cat.accuser_posts.count, 'accused_posts'=> cat.accused_posts.count ,'total_posts'=> cat.total_posts
          }
        }
      end
      my_arr
    end

end
