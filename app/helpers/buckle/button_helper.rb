module Buckle
  module ButtonHelper

    mattr_accessor :modifiers
    self.modifiers = %w( default primary success info warning danger link lg sm xs block ).map(&:to_sym)

    def btn_tag( *args, &block )
      mods = modifiers & [*args]
      klasses = mods.push(:default).uniq.map { |mod| "btn-#{ mod }" }
      options = args.find { |arg| arg.is_a?(Hash) } || {}
      options[:class] = [options[:class], 'btn', *klasses].compact.join(' ')
      options[:type] ||= nil
      content = args.find { |arg| arg.is_a?(String) }

      button_tag(content, options, &block)
    end

  end
end
