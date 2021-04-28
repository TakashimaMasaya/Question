class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :answers
  has_many :quests
end
