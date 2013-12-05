require_dependency "buckle/application_controller"

module Buckle
  class StyleGuideController < ApplicationController

    helper BlockquoteHelper
    helper CodeHelper
    helper PanelHelper

    def index
    end

    def css
    end

  end
end
