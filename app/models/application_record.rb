class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :updated, -> {order(updated_at: :desc)}
end
