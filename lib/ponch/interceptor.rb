module Ponch
  class Interceptor

    def self.delivering_email(mail)
      if html_part = (message.html_part || (message.content_type =~ /text\/html/ && message))
        delivery = Ponch::Delivery.create_from_mail! mail

        message_body = html_part.body.to_s

        html_doc = Nokogiri::HTML(message_body)

        #TODO add host
        html_doc.at("body").add_child("<img src=\"/ponch/tracking/#{delivery.code}.gif\" />")

        # Reset the body
        message.body = nil
        # Add an HTML part with CSS inlined.
        message.html_part do
          content_type "text/html; charset=utf-8"
          body html_doc.to_s
        end

        #mostyl taken from
        #https://github.com/ndbroadbent/actionmailer_inline_css/blob/master/lib/action_mailer/inline_css_hook.rb
        existing_text_part = message.text_part && message.text_part.body.to_s
        message.text_part do
          content_type "text/plain; charset=utf-8"
          #this is a hack for fixing new lines
          body existing_text_part || html_doc.textn.squeeze.strip.gsub("\n", "\r\n")
        end

      end
    end

  end
end
