class Legislation < ApplicationRecord
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :politicians, through: :votes

  validates :title, presence: true

  enum status: {proposed: 'proposed', passed: 'passed', failed: 'failed'}

  def total_votes
    votes.count
  end

  def yes_votes
    votes.yes.count
  end

  def no_votes
    votes.no.count
  end

  def abstain_votes
    votes.abstain.count
  end

  def self.find_or_create_legislation(user:, title:, description:, status: 'proposed')
    legislation = find_by(title: title)

    return legislation if legislation.present?

    create!(user: user, title: title, description: description, status: status)
  end

  def self.finance_bill2024
    Legislation.find_by(title: 'Finance Bill 2024')
  end
end
