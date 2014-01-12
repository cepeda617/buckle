module Buckle
  module IconHelper
    def icon_tag( icon_name )
      tag :span, class: "glyphicon glyphicon-#{ icon_name.to_s.dasherize }"
    end
  end
end
