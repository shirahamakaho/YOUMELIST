class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :dream
  has_many :favorites,dependent: :destroy

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
    # current_userがfavoriteしてる？
  end
end
