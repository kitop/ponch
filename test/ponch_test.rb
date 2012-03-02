require 'test_helper'
require 'rack/mock'

class MiddlewareTest < ActiveSupport::TestCase

  setup do
    @app = Dummy::Application
    @mail = TestMailer.hello("to@example.com").deliver
    @ponch = Ponch::Delivery.last
  end

  test "should mark ponch as open" do
    response = Rack::MockRequest.new(@app).get "/ponch/tracking/#{@ponch.code}.gif"

    @ponch.reload
    assert @ponch.opened?
  end

  test "should mark ponch as clicked" do
    response = Rack::MockRequest.new(@app).get "/?ponch=#{@ponch.code}"

    @ponch.reload

    assert @ponch.opened?
    assert @ponch.clicked?
  end

end
