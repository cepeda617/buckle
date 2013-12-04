module Buckle
  module BlockquoteHelper

    def blockquote_tag( content, options = {} )
      citation = content_tag :small, options[:cite] if options[:cite].present?
      content = content_tag :p, content
      content_tag :blockquote, [content, citation].join.html_safe, options.slice!(:cite)
    end

  end
end
