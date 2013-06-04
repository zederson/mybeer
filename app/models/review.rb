class Review < ActiveRecord::Base

  POINTS = (1..5).to_a

  belongs_to :user
  belongs_to :beer, :counter_cache => true

  validates_uniqueness_of :user_id, :scope => :beer_id
  validates_inclusion_of  :point, :in => POINTS
  validates :point, :user_id, :beer_id, :presence => true

  def self.stars
    (average(:point) || 0).round
  end

  def self.review_points
    Review::POINTS.last
  end

end
