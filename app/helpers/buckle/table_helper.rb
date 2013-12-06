module Buckle
  module TableHelper

    def table_for( collection, modifiers = nil, html_options = {}, &block )
      Table.new(collection, modifiers, html_options, &block).html
    end

    def table_tag( *modifiers, &block )
      table_class = modifiers.map { |mod| "table-#{ mod }" }.insert(0, 'table').join(' ')
      content_tag :table, class: table_class, &block
    end

    def table_header_tag( *columns )
      content_tag :thead do
        content_tag :tr do
          columns.map { |column| content_tag :th, column }.join("\n").html_safe
        end
      end
    end

    def table_row_tag( columns, context = nil, options = {} )
      if context.is_a? Hash
        options = context
      else
        options[:class] = [options[:class], context.to_s].compact.join(' ')
      end

      content_tag :tr, options do
        columns.map { |column| content_tag :td, column }.join("\n").html_safe
      end
    end

  end
end


