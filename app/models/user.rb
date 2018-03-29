class User < ApplicationRecord
  validates :role, presence: true, inclusion: { in: %w{admin member visitor} }
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def role?(name)
    role == name.to_s
  end
end
