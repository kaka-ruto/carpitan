class Politician < ApplicationRecord
  belongs_to :user
  has_many :businesses

  validates :name, presence: true
  validates :position, presence: true
  validates :jurisdiction, presence: true
end
