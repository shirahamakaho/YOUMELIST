class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lists
  has_many :dreams,through: :lists
  has_many :comments
  has_many :favorites, dependent: :destroy
  validates :email, uniqueness: true
  validates :name, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
