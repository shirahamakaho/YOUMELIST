class Dream < ApplicationRecord
  has_many :lists,dependent: :destroy
  has_many :users,through: :lists
  has_many :comments,dependent: :destroy
  validates :content, presence: true,on: :create

  def self.looks(search,word)
    search = "pertial_match"
    @dream = Dream.where("content LIKE?","%#{word}%")
  end
end
