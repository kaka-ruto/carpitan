class Business < ApplicationRecord
  belongs_to :user

  has_many :affiliations
  has_many :politicians, through: :affiliations

  validates :name, presence: true
end
