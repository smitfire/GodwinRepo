class UsersController < ApplicationController
  def index
  end

  def new
  	
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    post_dates = []
    @posts.each do |pd|
      if !(pd.event_date.nil? or pd.event_date == 0)  
        post_dates << {:date => Date.parse(pd.event_date), label: pd.title, value: pd.likes.count + pd.comments.count*rand(150..220)}
        # post_dates << {:date => pd.created_at, label: pd.title, value: pd.likes.count + pd.comments.count*rand(150..220)}
      end
    end
    post2_dates = post_dates.sort_by{ |k,v| k[:date] }
    if request.xhr?
      render json: { lineChart: post2_dates, 
          pieChart: [ 
          {
            color:"red",
            description: "Likes",
            title: @user.twitter.capitalize,
            value: @user.total_likes_received, 
          },
          {
            color: "blue",
            description: "Posts",
            title: "User since: #{@user.created_at.strftime("%B %d, %Y")}",
            value: @posts.count 
          }
        ]
      }
    else
      render 'show'
    end
  end

end
