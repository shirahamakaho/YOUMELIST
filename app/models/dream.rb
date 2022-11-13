class Dream < ApplicationRecord
  has_many :lists
  has_many :users,through: :lists
  has_many :comments
  validates :content, presence: true
end
