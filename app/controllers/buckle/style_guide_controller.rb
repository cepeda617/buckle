module Buckle
  class StyleGuideController < ApplicationController

    before_filter :set_style_guide

    def index
    end

    def css
    end

    def components
    end

    private

    def set_style_guide
      @style_guide = StyleGuide.new
    end

  end
end
