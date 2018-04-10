class Hog < ActiveRecord::Base
  belongs_to :user
  has_one :weight

  def slug
    self.username.to_s.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Hog.all.find{|u| u.slug == slug}
  end


end
