module Buckle
  module PanelHelper

    def panel_tag( type = :default, content = nil, options = {}, &block )
      content_tag :div, class: "panel panel-#{ type.to_s }" do
        panel_heading(options[:header]) if options.key? :header
        content_tag :div, (concat block_given? ? capture(&block) : content), class: 'panel-body'
        panel_footer(options[:footer]) if options.key? :footer
      end
    end

    def panel_heading( content )
      content_tag :div, panel_title(content), class: 'panel-heading'
    end

    def panel_footer( content )
      content_tag :div, content, class: 'panel-footer'
    end

    def panel_title( content = nil )
      content_tag :h3, content, class: 'panel-title' if content
    end

  end
end
