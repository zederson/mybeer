#encoding: utf-8

class User < ActiveRecord::Base

  has_many :beers

  scope   :most_recent, order('create_at DESC')

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}

  validates_confirmation_of :password

  has_secure_password

  def self.authenticate (email, password)
    self.find_by_email(email).try(:authenticate, password)
  end
end