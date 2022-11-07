class DreamList
  include ActiveModel::Model
  attr_accessor :content,:user_id,:dream_id

  with_options presence: true do
    validates :content
    validates :user_id
    validates :dream_id
  end

  def save
    dream = Dream.find_or_create_by(content:content)
    # dream_paramsに入ってるcontentと同じcontentがテーブルにあるか探す。なければ保存
    List.create(user_id:current_user.id,dream_id:dream.id)
  end
end