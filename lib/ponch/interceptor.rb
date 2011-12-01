require 'nokogiri'

module Ponch
  class Interceptor

    def self.delivering_email(message)
      if html_part = (message.html_part || (message.content_type =~ /text\/html/ && message))
        delivery = Ponch::Delivery.create_from_mail message

        message_body = html_part.body.to_s

        html_doc = Nokogiri::HTML(message_body)

        pixel_url = Rails.application.routes.url_helpers.ponch_pixel_url(delivery.code, Ponch.config.url_options)
        tracking_pixel = "<img src=\"#{pixel_url}\" />"
        html_doc.at("body").add_child(tracking_pixel)

        #set the HTML part with tracking pixel at the end
        html_part.body =  html_doc.to_s
      end
      message
    end

  end
end
