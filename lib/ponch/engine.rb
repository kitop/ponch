require 'ponch/interceptor'

module Ponch
  class Engine < ::Rails::Engine#:nodoc:

    #action mailer register_interceptor
    ActiveSupport.on_load(:action_mailer) do
      ActionMailer::Base.register_interceptor(Interceptor)
    end

  end
end
