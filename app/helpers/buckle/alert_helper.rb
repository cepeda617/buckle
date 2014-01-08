module Buckle
  module AlertHelper
    def close_button_tag
      button_tag '&times;'.html_safe, class: 'close', data: { dismiss: 'alert' }
    end

    def flash_alerts
      flash.map do |type, value|
        type = :success if type == :notice
        type = :danger if type == :alert
        alert_tag type, value
      end.join.html_safe
    end

    def alert_tag( type, value )
      type = :info unless %w( success info warning danger ).include? type.to_s
      content_tag :div, class: "alert alert-#{ type } alert-dismissable" do
        close_button_tag + value
      end
    end
  end
end
