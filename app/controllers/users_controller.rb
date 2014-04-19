class UsersController < ApplicationController
  def index
  end

  def new
  	
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    post_dates = []
    @user.posts.each do |pd|
      post_dates << {:date => pd.created_at.strftime("%Y-%m-%d"), label: pd.title, value: pd.likes.count + pd.comments.count*100}
    end

    if request.xhr?
      render json: { lineChart: post_dates, 
          pieChart: [ 
          {
            color:"red",
            description: "Total Likes Received",
            title: @user.name.capitalize,
            value: @user.total_likes_received, 
          },
          {
            color: "blue",
            description: "Total Posts",
            title: @user.name.capitalize,
            value: @posts.count 
          }
        ]
      }
    end
  end

end
