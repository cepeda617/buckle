module Buckle
  module TableHelper

    class HtmlElement

      include ActionView::Helpers::TagHelper

      attr_accessor :html_options

      delegate :[], :[]=, to: '@html_options'

      def initialize( html_options = {} )
        @html_options = html_options.symbolize_keys
      end

      def html
        content_tag(tag_name, content.to_s.html_safe, html_options)
      end

      alias_method :to_s, :html

      private

      attr_accessor :tag_name, :content

    end
  end
end
