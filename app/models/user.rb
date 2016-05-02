class User < ActiveRecord::Base
  devise :omniauthable

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.encrypted_password = Devise.friendly_token[0,20]
    end
  end

  def self.get_user_groups(uid)
    # buil url to get all groups a redmine user is associated with
    url = "https://redmine.cbe-digital.de/users/" + uid.to_s + ".json"
    params = { :key => "e8cf7c6327026fc9b06b9b30dd3a987cfcba8bad", :include => 'groups' }

    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    # get groups
    user = JSON.parse(response.body)
    groups = user['user']['groups']
  end

  def self.user_is_authorized(uid)
    groups = get_user_groups(uid)
    access = false

    # iterate through groups to see if user is member of group Wetzelbemm
    groups.map do |group|
      if group["name"] == 'Wetzelbemm'
        access = true
        return access
      end
    end
    # return false if user is no memeber of group Wetzelbemm
    return access
  end
end
