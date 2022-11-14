class List < ApplicationRecord
  belongs_to :user
  belongs_to :dream

  def list_in?
  end
end
