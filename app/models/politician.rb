class Politician < ApplicationRecord
  belongs_to :user
  has_many :businesses
  has_many :votes

  validates :name, presence: true
  validates :position, presence: true
  validates :jurisdiction, presence: true

  def to_combobox_display
    name
  end
end
