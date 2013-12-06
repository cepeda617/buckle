module Buckle
  module TableHelper

    class BodyRow < Row

      def initialize( object, parent )
        super(parent)

        table.header.column_names.each do |column|
          value = object.send(column) if object.respond_to?(column)
          cell(column, value)
        end
      end

      def html
        options = @html_options.dup
        html = super
        @html_options = options
        html
      end

      private

      def content
        number_of_columns_to_skip = 0

        html = table.header.column_names.map do |column|
          number_of_columns_to_skip -= 1 and next if number_of_columns_to_skip > 0

          if cell = cells[column]
            number_of_columns_to_skip = (cell[:colspan] || 1) - 1
          else
            cell = Cell.new(column, nil)
          end

          cell.html
        end

        html.select(&:present?).join
      end

    end

  end
end
