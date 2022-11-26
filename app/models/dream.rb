class Dream < ApplicationRecord
  has_many :lists,dependent: :destroy
  has_many :users,through: :lists
  has_many :comments,dependent: :destroy
  validates :content, presence: true,on: :create

  def list_in?(user)
    lists.where(user_id: user.id).exists?
  end

  def self.looks(search,word)
    search = "pertial_match"
    @dream = Dream.where("content LIKE?","%#{word}%")
  end
  
  def self.user_ranking
    Dream.find(List.group(:dream_id).order('count(dream_id) desc').pluck(:dream_id))
    # ユーザー数順に並び替え dream_idでグループ分け→多い順に並べる→数字で取り出す
  end
  
  def self.comment_ranking
    Dream.find(Comment.group(:dream_id).order('count(dream_id) desc').pluck(:dream_id))
  end
end
