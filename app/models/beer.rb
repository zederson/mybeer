#encoding: utf-8

class Beer < ActiveRecord::Base

  scope :most_recent, order('created_at DESC')

  belongs_to :user

  validates :name, :presence => true
  validates :style, :presence => true
end
