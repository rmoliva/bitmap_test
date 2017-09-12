# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # Initialize transformation class
    class Initialize
      class << self
        # Creates a new bitmap object
        def perform(with, height, initial_color = '0')
          BitmapEditor::Bitmap.new(with, height, initial_color)
        end
      end
    end
  end # Transformations
end # BitmapEditor
