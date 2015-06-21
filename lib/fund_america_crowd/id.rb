module FundAmericaCrowd
  class Id

    attr_reader :request_id
    attr_reader :id
    attr_reader :error

    # Create a new banc_box id.
    #
    # @param options [Hash] Either a FundAmerica id or a reference id.
    #   One or the other is required.
    # @option options [Integer] :banc_box_id The FundAmerica id for the client.
    # @option options [String] :reference_id Your own id for the client.
    # @return [FundAmerica::Id] The new id.
    def initialize(options={})
      @request_id = options[:request_id]
      @id = options[:id]
      @error = options[:error] ? FundAmericaCrowd::Error.new(options[:error]) : nil
    end

    def self.from_response(response)
      self.new(
        :request_id => response['request_id'],
        :id => response['id'],
        :error => response['error'] ? response['error'] : nil
      )
    end

    # Convert the id object to a hash appropriate for sending to FundAmerica
    #
    # @return [Hash] The data hash
    def to_hash
      {
        :request_id => @request_id,
        :id => @id
      }
    end
  end
end