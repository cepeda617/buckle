module Buckle
  module CalloutHelper

    def callout_tag( content = nil, options = {}, &block )
      type = options.fetch(:type, :info)
      options[:class] = [options[:class], 'callout', "callout-#{ type }"].join(' ')
      content_tag :div, content, options.slice!(:type), &block
    end

  end
end
