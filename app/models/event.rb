class Event < ApplicationRecord
  has_many :traitors, dependent: :destroy
  has_many :supporters, dependent: :destroy

  validates :name, :date, :location, presence: true
end
