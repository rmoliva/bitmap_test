# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # Initialize transformation class
    class Initialize
      class << self
        # Creates a new bitmap object
        # params:
        # - width
        # - height
        # - color
        def perform(params)
          width = params.fetch(:width, 0)
          height = params.fetch(:height, 0)
          color = params.fetch(:color, '0')

          BitmapEditor::Bitmap.new(width, height, color)
        end
      end
    end
  end # Transformations
end # BitmapEditor
