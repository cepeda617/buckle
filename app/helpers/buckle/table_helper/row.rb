module Buckle
  module TableHelper

    class RowBuilder

      def initialize( row )
        @row = row
      end

      def define_cell( name )
        method_name = name.gsub('-', '_')
        klass = class << self; self; end

        klass.class_eval do
          define_method(method_name) do |*args|
            args.empty? ? @row.cells[name] : @row.cell(name, *args)
          end
        end unless klass.method_defined?(method_name)
      end

      def undefine_cell( name )
        method_name = name.gsub('-', '_')
        klass = class << self; self; end

        klass.class_eval do
          remove_method(method_name)
        end
      end

      protected

      def method_missing( *args )
        @row.send(*args)
      end

    end

    class Row < HtmlElement

      attr_reader :builder, :cells, :parent

      delegate :empty?, to: :cells
      delegate :table, to: :parent

      def initialize( parent )
        super()

        @parent = parent
        @cells = {}
        @builder = RowBuilder.new(self)
      end

      def cell( name, *args )
        name = name.to_s if name
        options = args.last.is_a?(Hash) ? args.pop : {}
        args << options

        cell = Cell.new(name, *args)
        cells[name] = cell
        builder.define_cell(name) if name

        cell
      end

      def cell_names
        cells.keys
      end

      def clear
        cell_names.each { |name| builder.undef_cell(name) }
        cells.clear
      end

      private

      def tag_name
        'tr'
      end

      def content
        cells.values.map(&:html).join
      end

    end

  end
end
