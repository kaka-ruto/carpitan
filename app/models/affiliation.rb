class Affiliation < ApplicationRecord
  belongs_to :politician
  belongs_to :business

  enum relationship: { owned: 0, family_owned: 1, co_owned: 2 }

  accepts_nested_attributes_for :business, reject_if: -> (attributes) { attributes['name'].blank? }, allow_destroy: true
end
