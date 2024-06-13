class Business < ApplicationRecord
  belongs_to :user
  belongs_to :politician

  validates :name, presence: true
end
