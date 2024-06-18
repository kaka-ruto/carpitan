class Legislation < ApplicationRecord
  belongs_to :user

  has_many :politicians, through: :votes

  validates :title, presence: true

  enum status: {proposed: "proposed", passed: "passed", failed: "failed"}
end
