class Event < ApplicationRecord
  has_many :traitors, dependent: :destroy

  validates :name, :date, :location, presence: true
end
