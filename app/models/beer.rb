#encoding: utf-8

class Beer < ActiveRecord::Base

  scope :most_recent, order('created_at DESC')

  belongs_to :user
  has_many :reviews

  validates :name, :presence => true
  validates :style, :presence => true

  def stars
    reviews.stars
  end

end
