module Buckle
  module CodeHelper

    def code_tag( syntax_or_content = nil, syntax = :text, options = {}, &block )
      content = block_given? ? capture(&block) : syntax_or_content
      syntax = syntax_or_content || syntax if block_given?
      CodeRay.scan(content, syntax, options).div(css: :class).html_safe
    end

  end
end
