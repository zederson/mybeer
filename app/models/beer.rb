#encoding: utf-8

class Beer < ActiveRecord::Base

  validates :name, :presence => true
  validates :style, :presence => true
end
