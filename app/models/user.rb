class User < ActiveRecord::Base
  has_many :authorizations

  has_many :app_developers
  has_many :apps, through: :app_developers

  before_create :make_slug
  validates_uniqueness_of :username

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :username => hash['user_info']['nickname'], image_url: hash['user_info']['image'])
  end

  def provider
    user_auth = authorizations.first
    user_auth.provider
  end

  def provider_icon
    if provider == 'facebook'
      '/img/facebookIcon.png'
    elsif provider == 'twitter'
      '/img/twitterIcon.png'
    end
  end

  def url
    if provider == 'facebook'
      "http://facebook.com/#{username}"
    elsif provider == 'twitter'
      "http://twitter.com/#{username}"
    end
  end

  private

  def make_slug
    self.slug = self.username.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end
end
