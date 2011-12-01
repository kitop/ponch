require "ponch/version"
require 'ponch/config'
require 'ponch/engine'

module Ponch

  class << self
    def config
      @config ||= Ponch::Config.new
      yield(@config) if block_given?
      @config
    end
  end

end
