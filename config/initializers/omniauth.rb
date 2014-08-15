Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FB_KEY"], ENV["FB_SECRET"], secure_image_url: true, image_size: 'square'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope:"user:email, user:follow, user:name"
end