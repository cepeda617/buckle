module Buckle
  module TableHelper

    def table_for( collection, modifiers = nil, html_options = {}, &block )
      modifiers = [*modifiers]
      responsive = modifiers.delete(:responsive)
      table = Table.new(collection, modifiers, html_options, &block).html
      responsive ? content_tag(:div, table, class: 'table-responsive') : table
    end

  end
end


