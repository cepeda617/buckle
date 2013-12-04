module Buckle
  module BlockquoteHelper

    def blockquote_tag( content, options = {} )
      citation = '<small>%s</small>' % options[:cite] if options[:cite].present?
      content_tag :blockquote, [content, citation].join.html_safe, options.slice!(:cite)
    end

  end
end
