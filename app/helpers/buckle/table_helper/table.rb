module Buckle
  module TableHelper

    class Table < Buckle::HtmlElement

      attr_reader :collection, :klass, :rows

      def initialize( collection, modifiers = nil, html_options = {} )
        html_options, modifiers = modifiers, nil if modifiers.is_a?(Hash)
        super(html_options)

        @collection = collection
        @klass = collection.first.class unless collection.empty?

        self[:class] = [*modifiers].map { |mod| "table-#{ mod }" }.insert(0, 'table').join(' ')

        @header = Header.new(self)
        @rows = Body.new(self)
        @footer = Footer.new(self)

        yield self if block_given?
      end

      def empty?
        collection.empty?
      end

      def header( *args )
        args.empty? ? @header : @header.column(*args)
      end

      def footer( *args )
        args.empty? ? @footer : @footer.cell(*args)
      end

      private

      def tag_name
        'table'
      end

      def content
        content = ''
        content << @header.html unless @header.empty?
        content << @rows.html
        content << @footer.html unless @footer.empty?
        content
      end

    end

  end
end
