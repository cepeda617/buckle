module Buckle
  module TableHelper

    class Body < HtmlElement

      attr_accessor :empty_caption
      attr_reader :table

      def initialize( table )
        super()

        @table = table
        @empty_caption = 'No matches found.'
      end

      def each( &block )
        @builder = block
      end

      def body_row( object, index = table.collection.index(object) )
        row = BodyRow.new(object, self)
        @builder.call(row.builder, object, index) if @builder
        row.html
      end

      private

      def tag_name
        'tbody'
      end

      def content
        content = ''

        if table.empty? && @empty_caption.present?
          row = Row.new(self)
          html_options = {}
          html_options[:colspan] = table.header.columns.size if table.header.columns.size > 1
          row.cell nil, @empty_caption, html_options
          content << row.html
        else
          table.collection.each_with_index do |object, index|
            content << body_row(object, index)
          end
        end

        content
      end

    end

  end
end
