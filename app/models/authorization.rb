class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    unless auth = find_by(provider: auth_hash["provider"], uid: auth_hash["uid"])
      pword = auth_hash['info']['name'].reverse
      user = User.create!(name: auth_hash["info"]["name"], email: auth_hash["info"]["email"], password: pword, password_confirmation: pword, pic: auth_hash[:info][:image])
      auth = create(user_id: user.id, provider: auth_hash["provider"], uid: auth_hash["uid"])
    end
    auth
  end
end
