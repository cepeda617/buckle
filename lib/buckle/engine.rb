require 'bootstrap-sass'
require 'coderay'
require 'slim-rails'

module Buckle
  class Engine < ::Rails::Engine
    isolate_namespace Buckle

    initializer 'buckle.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Buckle::Engine.helpers
      end
    end
  end
end
