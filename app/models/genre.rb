class Genre < ActiveRecord::Base
  has_many :directors, :through => :movies
  has_many :movie_genres
  has_many :movies, :through => :mmovie_genres

  def slug
    self.name.downcase.gsub(/\s/, "-")
  end

  def self.find_by_slug(slug)
    Genre.all.each do |a|
      if a.slug == slug
        return a
      end
    end
  end
end
