module Buckle
  module TableHelper

    class Footer < HtmlElement

      attr_reader :table, :row

      delegate :cell, :empty?, to: :row

      def initialize( table )
        super()

        @table = table
        @row = Row.new(self)
      end

      def cells
        row.cells.values
      end

      def colspan
        table.header.columns.length - cells[0..-2].inject(0) do |count, cell|
          count += (cell[:colspan] || 1).to_i
        end
      end

      def html
        cells.last[:colspan] ||= colspan if colspan > 1
        html_options = @html_options.dup
        content_tag(tag_name, content, html_options) unless table.empty?
      end

      private

      def tag_name
        'tfoot'
      end

      def content
        @row.html
      end

    end

  end
end
