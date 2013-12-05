module Buckle
  module BlockquoteHelper

    def blockquote_tag( content = nil, options = {}, &block )
      content_tag :blockquote, options.slice!(:cite) do
        concat content_tag :p, block_given? ? capture(&block) : content
        concat content_tag :small, options[:cite] if options.key? :cite
      end
    end

  end
end
