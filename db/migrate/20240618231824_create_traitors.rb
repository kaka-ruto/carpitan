class CreateTraitors < ActiveRecord::Migration[7.1]
  def change
    create_table :traitors do |t|
      t.string :name
      t.string :handles
      t.string :linked_tweet
      t.string :screenshot
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
