class User < ActiveRecord::Base
  has_many :authorizations
  has_and_belongs_to_many :apps
  before_create :make_slug
  validates_uniqueness_of :username

  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'], :username => hash['user_info']['nickname'])
  end
  private

  def make_slug
    self.slug = self.username.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

end
