# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # SetColor transformation class
    class SetColor
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        def perform(bitmap, x, y, color = 0)
          bitmap.set_color(x, y, color)
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
