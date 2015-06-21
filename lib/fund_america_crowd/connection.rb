module FundAmericaCrowd
  class Connection

    def initialize
      @key = FundAmericaCrowd::Config.api_key
      #@secret = FundAmericaCrowd::Config.api_secret
      @base_url = FundAmericaCrowd::Config.base_url
    end

    # Perform an HTTP POST request
    def post(path, data={})
      request(:post, path, data)
    end

    private

    def request(method, path, data)
      data ||= {}
      data.merge!(authentication_data)
      response = faraday_connection.send(method) do |request|
        case method
        when :delete, :get
          request.url(path, params)
        when :post
          request.path = path
          request.body = data unless data.empty?
        end
      end
      response.body
    end

    def authentication_data
      { 
        #'user' => 'WY0EIfchfdEwDonUJNngLVrIrIecP9T3',
        #'password' =>''
       # 'secret' => FundAmericaCrowd::Config.api_secret
      }
    end

    def faraday_connection
      options = {
        :url => @base_url
      }
      @faraday_connection ||= Faraday::Connection.new(options) do |builder|
        builder.use Faraday::Request::UrlEncoded
        # builder.use Faraday::Request::Multipart
        builder.use FaradayMiddleware::EncodeJson
        builder.use FaradayMiddleware::ParseJson
        # builder.use FaradayMiddleware::Mashify
        #builder.adapter Faraday.default_adapter
        builder.use Faraday::Request::BasicAuthentication, @key, nil
        builder.use Faraday::Adapter::NetHttp
      end
    end
  end
end