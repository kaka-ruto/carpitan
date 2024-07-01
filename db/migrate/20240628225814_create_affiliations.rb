class CreateAffiliations < ActiveRecord::Migration[7.1]
  def change
    create_table :affiliations do |t|
      t.references :politician, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true
      t.integer :relationship

      t.timestamps
    end
  end
end
