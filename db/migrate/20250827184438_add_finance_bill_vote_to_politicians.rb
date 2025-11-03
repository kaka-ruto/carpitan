class AddFinanceBillVoteToPoliticians < ActiveRecord::Migration[7.1]
  def change
    add_column :politicians, :finance_bill_vote, :string
  end
end
