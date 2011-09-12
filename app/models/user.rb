class User < ActiveRecord::Base
  has_many :authorizations
  has_and_belongs_to_many :apps

  def self.create_from_hash!(hash)
    create(:username => hash['user_info']['name'])
  end
end
