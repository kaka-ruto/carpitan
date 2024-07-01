class Politician < ApplicationRecord
  belongs_to :user
  has_many :affiliations
  has_many :businesses, through: :affiliations, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :position, presence: true
  validates :jurisdiction, presence: true

  def to_combobox_display
    name
  end
end
