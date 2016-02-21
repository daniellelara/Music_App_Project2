module Sinatra
  module Flash
    module Style
      def styled_flash(key=:flash)
        return "" if flash(key).empty?
        id = (key == :flash ? "flash" : "flash_#{key}")

        close = "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"

        messages = flash(key).map { |message|
          "<div class='alert alert-#{message[0]} alert-dismissible' role='alert'>#{close}\n #{message[1]}</div>\n"
        }

        "<div id='#{id}'>\n" + messages.join + "</div>"
      end
    end
  end
end