require 'faraday'

class Falcon
  def self.create_connection()
    Faraday.new do |faraday|
      faraday.request   :url_encoded            # form-encode POST params
      faraday.response  :logger                 # log requests to STDOUT
      faraday.adapter   Faraday.default_adapter # make requests with Net::HTTP
    end
  end
end
