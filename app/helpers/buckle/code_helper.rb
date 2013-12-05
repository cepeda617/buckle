module Buckle
  module CodeHelper

    def code_tag( content, syntax = :text, options = {}, &block )
      CodeRay.scan(content, syntax, options, &block).div(css: :class).html_safe
    end

  end
end
