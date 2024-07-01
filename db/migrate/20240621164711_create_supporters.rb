class CreateSupporters < ActiveRecord::Migration[7.1]
  def change
    create_table :supporters do |t|
      t.string :name
      t.string :contact_info
      t.string :function
      t.string :category
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
