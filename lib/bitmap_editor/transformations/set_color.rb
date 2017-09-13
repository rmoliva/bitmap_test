# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # SetColor transformation class
    class SetColor
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        # params
        # - x
        # - y
        # - color: defaults to '0'
        def perform(bitmap, params)
          x = params.fetch(:x, 0)
          y = params.fetch(:y, 0)
          color = params.fetch(:color, '0')

          # Set the color on the bitmap array
          bitmap.set_color(x, y, color)
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
