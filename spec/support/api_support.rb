require 'spree/api/testing_support/caching'
require 'spree/api/testing_support/helpers'
require 'spree/api/testing_support/setup'
require 'spree/api/testing_support/v2/base'
require 'spree/api/testing_support/v2/current_order'

RSpec.configure do |config|
  config.include JSONAPI::RSpec
  config.include Spree::Api::TestingSupport::Helpers, type: :controller
  config.include Spree::Api::TestingSupport::Helpers, type: :request
  config.extend Spree::Api::TestingSupport::Setup, type: :controller

  config.before do
    Spree::Api::Config[:requires_authentication] = true
  end
end