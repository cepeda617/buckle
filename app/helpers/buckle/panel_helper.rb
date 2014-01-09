module Buckle
  module PanelHelper

    def panel_tag( content_or_options = nil, options = {}, &block )
      options = content_or_options if block_given? && content_or_options.is_a?(Hash)
      options ||= {}

      type = options.fetch(:type, :default).to_s
      header, footer = options.delete(:header), options.delete(:footer)
      options[:class] = [options[:class], 'panel', "panel-#{ type }"].compact.join(' ')

      content_tag :div, options do
        concat panel_heading(header) if header
        concat block_given? ? capture(&block) : panel_body(content_or_options)
        concat panel_footer(footer) if footer
      end
    end

    def panel_heading( content = nil, &block )
      content_tag :div, panel_title(content), class: 'panel-heading', &block
    end

    def panel_body( content = nil, &block )
      content_tag :div, content, class: 'panel-body', &block
    end

    def panel_footer( content = nil, &block )
      content_tag :div, content, class: 'panel-footer', &block
    end

    def panel_title( content = nil )
      content_tag :h3, content, class: 'panel-title' if content
    end

  end
end
