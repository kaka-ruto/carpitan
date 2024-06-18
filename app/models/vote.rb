class Vote < ApplicationRecord
  belongs_to :politician
  belongs_to :legislation
  belongs_to :user

  validates :politician_id, uniqueness: {scope: :legislation_id, message: "already voted on this legislation"}
  validates :choice, presence: true

  enum choice: {yes: "yes", no: "no", abstain: "abstain"}
end
