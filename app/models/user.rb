#encoding: utf-8
require 'digest/sha2'

class User < ActiveRecord::Base

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password,  :confirmation => true

  attr_accessible :name, :email
  attr_accessor :password_confirmation
  attr_reader   :password

  validate :password_must_be_present

  def self.authenticate(login, pass)
    user = self.find_by_login(login)

    if user
      pass_encript = encrypted_password(pass, self.key)
      if user.password_encript == pass_encript
        user
      end
    end
  end

  def password=(password)
    @password = password

    if password.present?
      generate_new_key
      self.password_encript = User.encrypted_password(self.password, self.key)
    end
  end

  def self.encrypted_password (pass, key)
    string_to_hash = pass + "bender" + key
    Digest::SHA2.hexdigest string_to_hash
  end

private
  def password_must_be_present
    errors.add(:password, "Senha Nao Informada") unless password_encript.present?
  end

  def generate_new_key
    self.key = self.object_id.to_s + rand.to_s
  end

end