require "net/http"
require "json"

module ApiClient
  class << self
    def get_json(url)
      uri = URI(url)
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        Rails.logger.error("❌ API call failed: #{url} - #{response.code} #{response.message}")
        []
      end
    rescue StandardError => e
      Rails.logger.error("❌ API call error: #{url} - #{e.message}")
      []
    end
  end
end
