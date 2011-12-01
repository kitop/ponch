require 'ponch/interceptor'

module Ponch
  class Engine < ::Rails::Engine#:nodoc:

    config.ponch = ActiveSupport::OrderedOptions.new

    config.to_prepare do
      Ponch::Engine.config.ponch.each do |key, value|
        Ponch.config.send "#{key}=".to_sym, value
      end
    end

    #action mailer register_interceptor
    ActiveSupport.on_load(:action_mailer) do
      ActionMailer::Base.register_interceptor(Interceptor)
    end

  end
end
