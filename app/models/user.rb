require 'digest/sha1'

class User < ApplicationRecord
  validates :role, presence: true, inclusion: { in: %w{admin member visitor} }
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.hash_password(password)
    Digest::SHA1.hexdigest(password)
  end

  def role?(name)
    role == name.to_s
  end

  def password=(password)
    write_attribute(:password, self.class.hash_password(password))
  end
end
