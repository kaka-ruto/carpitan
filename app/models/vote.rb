class Vote < ApplicationRecord
  belongs_to :politician
  belongs_to :legislation
  belongs_to :user
end
