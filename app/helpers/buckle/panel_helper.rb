module Buckle
  module PanelHelper

    def panel_tag( type = :default, content = nil, options = {}, &block )
      content_tag :div, class: "panel panel-#{ type.to_s }" do
        concat panel_heading(options[:header]) if options.key? :header
        concat block_given? ? capture(&block) : panel_body(content)
        concat panel_footer(options[:footer]) if options.key? :footer
      end
    end

    def panel_heading( content )
      content_tag :div, panel_title(content), class: 'panel-heading'
    end

    def panel_body( content = nil, &block )
      content_tag :div, content, class: 'panel-body', &block
    end

    def panel_footer( content )
      content_tag :div, content, class: 'panel-footer'
    end

    def panel_title( content = nil )
      content_tag :h3, content, class: 'panel-title' if content
    end

  end
end
