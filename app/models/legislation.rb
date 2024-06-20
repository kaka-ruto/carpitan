class Legislation < ApplicationRecord
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :politicians, through: :votes

  validates :title, presence: true

  enum status: {proposed: "proposed", passed: "passed", failed: "failed"}

  def yes_votes
    votes.yes.count
  end

  def no_votes
    votes.no.count
  end

  def abstain_votes
    votes.abstain.count
  end
end
