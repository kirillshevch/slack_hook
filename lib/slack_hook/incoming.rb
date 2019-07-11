require 'net/http'
require 'json'
require 'uri'

module SlackHook
  class Incoming
    attr_reader :uri

    def initialize(link)
      @uri = URI.parse(link)
    end

    def post(payload)
      payload = payload.to_json
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data('payload' => payload)

      Net::HTTP.start(uri.hostname, uri.port, request_options) { |http| http.request(request) }
    end

    private

    def request_options
      {
        use_ssl: uri.scheme == 'https'
      }
    end
  end
end
