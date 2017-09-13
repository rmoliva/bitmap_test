# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # VerticalLine transformation class
    class VerticalLine
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        # params
        # - x
        # - from_y
        # - to_y
        # - color
        def perform(bitmap, params)
          x = params.fetch(:x, 0)
          from_y = params.fetch(:from_y, 0)
          to_y = params.fetch(:to_y, 0)
          color = params.fetch(:color, '0')
          (from_y..to_y).each do |y|
            bitmap.set_color(x, y, color)
          end
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
