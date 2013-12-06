module Buckle
  class StyleGuideController < ApplicationController

    before_filter :style_guide

    def index
    end

    def css
    end

    private

    def style_guide
      @style_guide = StyleGuide.new
    end

  end
end
