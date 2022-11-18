class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dream
  has_many :favorites,dependent: :destroy
  validates :comment, presence: true

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
    # current_userがfavoriteしてる？
  end
end
