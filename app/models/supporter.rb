class Supporter < ApplicationRecord
  belongs_to :event

  CATEGORIES = %w[Business/Organisation Individual].freeze

  validates :category, inclusion: {in: CATEGORIES}
  validates :name, presence: true, uniqueness: true
end
