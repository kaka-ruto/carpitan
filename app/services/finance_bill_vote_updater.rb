require 'net/http'
require 'json'
require 'logger'

class FinanceBillVoteUpdater
  def initialize(api_url: Rails.application.config.api_configs['politician_api'],
                 api_client: ApiClient, user_finder: -> { User.first })
    @api_url = api_url
    @api_client = api_client
    @user = user_finder.call
  end

  def call
    @api_client.get_json(@api_url).each { |data| update_or_create_politician(data) }
  rescue StandardError => e
    logger.error("❌ Unexpected error: #{e.message}")
  end

  private

  def update_or_create_politician(data)
    politician = Politician.find_or_initialize_by(name: data['NAME'])
    politician.update!(position: 'Member of parliament', jurisdiction: data['relation_name'], user: @user)
    update_finance_bill_vote(data['vote'], politician)
  rescue StandardError => e
    logger.error("❌ An unexpected error occured for #{data['NAME']}: #{e.message}")
  end

  def update_finance_bill_vote(data, politician) 
    result = save_finance_bill_vote(data, politician)
    if result.is_a?(Vote)
      logger.info("✅ Saved #{politician.name} with vote: #{politician.finance_bill_vote}")
    else
      logger.error("❌ Failed to save #{data['NAME']}: #{result}")
    end
  end

  def save_finance_bill_vote(vote, politician)
    result = Vote.new(
      choice: transform_vote(vote),
      politician: politician,
      legislation: Legislation.finance_bill2024,
      user_id: @user.id
    )
    return "✅ Error saving vote: #{result.errors.full_messages}" unless result.valid?

    result.save!
    result
  end

  def transform_vote(vote)
    { 'Y' => 'yes', 'N' => 'no', 'A' => 'abstain', 'U' => 'unavailable' }[vote&.upcase] || vote
  end

  def logger = @logger ||= Logger.new(Rails.root.join('log', 'finance_bill_updater.log'))
end