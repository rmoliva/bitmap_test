# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # HorizontalLine transformation class
    class HorizontalLine
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        def perform(bitmap, x1, x2, y, color)
          (x1..x2).each do |x|
            bitmap.set_color(x, y, color)
          end
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
