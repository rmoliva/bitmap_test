# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # VerticalLine transformation class
    class VerticalLine
      class << self
        # Sets the color of a pixel at an specific coordinates
        # returns the transformed BitmapEditor::Bitmap
        def perform(bitmap, x, y1, y2, color)
          (y1..y2).each do |y|
            bitmap.set_color(x, y, color)
          end
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
