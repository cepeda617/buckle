module Buckle
  module TableHelper

    class Cell < HtmlElement

      attr_reader :content, :content_type

      def initialize( name, content = name.to_s.titleize, html_options = {} )
        html_options, content = content, name.to_s.titleize if content.is_a?(Hash)
        namespace = html_options.delete(:namespace)
        super(html_options)

        @content = content.to_s

        if name
          name = [namespace, name].join('-') if namespace.present?
          self[:class] = [self[:class], name].join(' ').strip.gsub('_', '-')
        end

        self.content_type = :data
      end

      def content_type=( value )
        @content_type = [:data, :header].include?(value) ? value : :data
      end

      private

      def tag_name
        @content_type == :data ? 'td' : 'th'
      end

    end

  end
end
