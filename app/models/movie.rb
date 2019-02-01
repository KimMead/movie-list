class Movie < ActiveRecord::Base
  belongs_to :user


  def slug
    self.name.downcase.gsub(/\s/, "-")
  end

  def self.find_by_slug(slug)
    Movie.all.each do |a|
      if a.slug == slug
        return a
      end
    end
  end
end
