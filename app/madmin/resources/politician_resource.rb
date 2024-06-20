class PoliticianResource < Madmin::Resource
  attribute :id, form: false
  attribute :name
  attribute :office_phone
  attribute :office_email
  attribute :position
  attribute :jurisdiction
  attribute :political_party
  attribute :website

  attribute :user
  attribute :businesses
  attribute :votes

  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Uncomment this to customize the display name of records in the admin area.
  def self.display_name(record)
    record.name
  end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
