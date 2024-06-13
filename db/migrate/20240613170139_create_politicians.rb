class CreatePoliticians < ActiveRecord::Migration[7.1]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :office_phone
      t.string :office_email
      t.string :position
      t.string :jurisdiction
      t.string :political_party
      t.string :website
      t.timestamps

      t.references :user, null: false, foreign_key: true
    end

    add_reference :businesses, :politician, foreign_key: true
  end
end
