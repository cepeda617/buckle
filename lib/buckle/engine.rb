require 'bootstrap-sass'
require 'coderay'
require 'slim-rails'

module Buckle
  class Engine < ::Rails::Engine
    isolate_namespace Buckle
  end
end
