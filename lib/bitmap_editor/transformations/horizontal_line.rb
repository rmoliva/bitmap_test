# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # HorizontalLine transformation class
    class HorizontalLine
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        # params:
        # - from_x
        # - to_x
        # - y
        # - color
        def perform(bitmap, params)
          from_x = params.fetch(:from_x, 0)
          to_x = params.fetch(:to_x, 0)
          y = params.fetch(:y, 0)
          color = params.fetch(:color, '0')

          (from_x..to_x).each do |x|
            bitmap.set_color(x, y, color)
          end
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
