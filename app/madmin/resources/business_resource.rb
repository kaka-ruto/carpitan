class BusinessResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :address
  attribute :industry
  attribute :business_phone
  attribute :business_email
  attribute :website
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :user
  attribute :politicians, through: :affiliations

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
