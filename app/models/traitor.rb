class Traitor < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :handles, presence: true
  validates :linked_tweet, format: {with: URI::DEFAULT_PARSER.make_regexp(%w[http https])}, allow_blank: true
  validates :screenshot, format: {with: URI::DEFAULT_PARSER.make_regexp(%w[http https])}, allow_blank: true
end
