Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_KEY"], ENV["FB_SECRET"], secure_image_url: true, image_size: 'square'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope:"user:email, user:follow, user:name"
  provider :twitter, ENV["TW_KEY"], ENV["TW_SECRET"], 
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'true',
        :lang => 'pt'
      }
    }
end