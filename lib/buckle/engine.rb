require 'bootstrap-sass'

module Buckle
  class Engine < ::Rails::Engine
    isolate_namespace Buckle
  end
end
