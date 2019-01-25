class User < ActiveRecord::Base
  has_many :movies

  validates_presence_of :username, :email, :password
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.find{|user| user.slug == slug}
  end
end
