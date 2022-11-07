class Dream < ApplicationRecord
  has_many :lists
  has_many :users,through: :lists

  validates :content, presence: true
end
