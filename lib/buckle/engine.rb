require 'bootstrap-sass'
require 'coderay'
require 'slim-rails'

module Buckle
  class Engine < ::Rails::Engine
    isolate_namespace Buckle

    config.to_prepare do
      ApplicationController.helper(Buckle::Engine.helpers)
    end
  end
end
