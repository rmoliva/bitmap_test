# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # Clear transformation class
    class Clear
      class << self
        # Sets al the pixel array to one color
        # bitmap is a BitmapEditor::Bitmap object
        # returns the transformed BitmapEditor::Bitmap
        def perform(bitmap, color = '0')
          bitmap.fill(color)
          bitmap
        end
      end
    end
  end # Transformations
end # BitmapEditor
