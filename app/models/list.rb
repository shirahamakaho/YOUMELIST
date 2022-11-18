class List < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  def list_in?(user)
    lists.where(dream_id: dream.id).exists?
  end
end
