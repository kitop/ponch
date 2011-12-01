require 'ponch/routes'
require 'ponch/interceptor'

module Ponch
  class Engine < ::Rails::Engine#:nodoc:
    #action mailer register_interceptor

    ::ActionDispatch::Routing::Mapper.send :include, Routes

    ::ActionMailer::Base.register_interceptor(Interceptor)

  end
end
