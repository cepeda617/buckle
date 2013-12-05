require 'bootstrap-sass'
require 'coderay'

module Buckle
  class Engine < ::Rails::Engine
    isolate_namespace Buckle
  end
end
