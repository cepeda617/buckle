module Buckle
  module IconHelper
    def icon_tag( icon_name )
      "<span class='glyphicon glyphicon-#{ icon_name.to_s.dasherize }'></span>"
    end
  end
end
