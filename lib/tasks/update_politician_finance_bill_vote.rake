# lib/tasks/politicians.rake
namespace :politicians do
  desc 'Fetch and update politicians, with their Finance bill 2024 votes'
  task fetch_finance_bill_2024_vote: :environment do
    default_user = User.first
    Legislation.find_or_create_legislation(
      user: default_user,
      title: 'Finance Bill 2024',
      description: 'This is a punitive bill that seeked to overtax kenyans'
    )
    FinanceBillVoteUpdater.new.call
    puts 'Finance bill 2024 Votes added'
  rescue ActiveRecord::RecordInvalid => e
    puts "Failed to add finance bill votes: #{e.record}"
  end
end
