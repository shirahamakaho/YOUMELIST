class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dream
  has_many :favorites,dependent: :destroy
end
