#encoding: utf-8

class User < ActiveRecord::Base

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => {:with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/}

  validates_confirmation_of :password

  has_secure_password
end