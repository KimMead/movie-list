class Director < ActiveRecord::Base
  has_many :movies
  has_many :genres, :through => :movies

def slug
  self.name.downcase.gsub(/\s/, "-")
end

def self.find_by_slug(slug)
  Artist.all.each do |a|
    if a.slug == slug
      return a
    end
  end
end
end
