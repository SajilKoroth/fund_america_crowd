require 'faraday'
require 'faraday_middleware'

files = [
  'id', 'api', 'config', 'connection', 'error'
]

files.each do |file|
  require File.join(File.dirname(__FILE__), 'fund_america_crowd', file)
end

module FundAmericaCrowd

  extend FundAmericaCrowd::Api

  def self.configure
    yield Config
    Config
  end

  def self.connection
    @connection ||= FundAmericaCrowd::Connection.new
  end
end