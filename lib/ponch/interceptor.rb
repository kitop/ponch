require 'nokogiri'

module Ponch
  class Interceptor

    def self.delivering_email(message)
      if html_part = (message.html_part || (message.content_type =~ /text\/html/ && message))
        delivery = Ponch::Delivery.create_from_mail message

        message_body = html_part.body.to_s

        html_doc = Nokogiri::HTML(message_body)

        #intercept_links
        html_doc.search("a[href*='#{Ponch.config.url_options[:host]}']").each do |link|
          href = link.attr("href")
          uri = URI.parse(href)
          query = Rack::Utils.parse_nested_query uri.query
          query[:ponch] = delivery.code
          uri.query = query.to_query
          link.attributes["href"].value = uri.to_s
        end

        pixel_url = Ponch::Helpers.url_for delivery.code
        tracking_pixel = "<img src=\"#{pixel_url}\" />"
        html_doc.at("body").add_child(tracking_pixel)

        #set the HTML part with tracking pixel at the end
        html_part.body =  html_doc.to_s
      end
      message
    end

  end
end
