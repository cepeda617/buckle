module Buckle
  module TableHelper

    class Header < HtmlElement

      attr_reader :table, :row

      delegate :empty?, to: :row

      def initialize( table )
        super()

        @table = table
        @row = Row.new(self)

        if table.klass && table.klass.respond_to?(:column_names)
          if !table.empty? && klass < ActiveRecord::Base
            column_names = table.collection.first.attributes.keys
          else
            column_names = klass.column_names
          end

          column(*column_names.map(&:to_sym))
        end

        @customized = false
      end

      def columns
        row.cells
      end

      def column_names
        row.cell_names
      end

      def clear
        row.clear
      end

      def column( *names )
        unless @customized
          @customized = true
          clear
        end

        options = names.pop if names.last.is_a? Hash
        content = names.pop if names.last.is_a? String
        args = [content, options].compact

        names.map! do |name|
          column = row.cell(name, *args)
          column.content_type = :header
          column
        end

        names.length == 1 ? names.first : names
      end

      def html
        content_tag(tag_name, content, @html_options.dup) unless table.empty?
      end

      private

      def tag_name
        'thead'
      end

      def content
        @row.html
      end

    end

  end
end
