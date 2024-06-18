class CreateLegislations < ActiveRecord::Migration[7.1]
  def change
    create_table :legislations do |t|
      t.string :title
      t.text :description
      t.string :status, default: "proposed"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
