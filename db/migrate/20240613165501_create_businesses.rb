class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :industry
      t.string :business_phone
      t.string :business_email
      t.string :website
      t.timestamps
    end

    add_reference :businesses, :user, foreign_key: true
  end
end
