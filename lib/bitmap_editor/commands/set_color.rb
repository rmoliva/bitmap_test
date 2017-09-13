# encoding: utf-8
# frozen_string_literal: true

# Load base class first
require File.join(__dir__, 'base')

module BitmapEditor
  module Commands
    # SetColor command class
    class SetColor < Base
      class << self
        def key
          'L'
        end

        def transformation
          BitmapEditor::Transformations::SetColor
        end
      end

      protected

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - L x y color
      def parse!(bitmap)
        parts = @string_command.split(' ')
        validate!(
          bitmap,
          x: parts[1].to_i,
          y: parts[2].to_i,
          color: parts[3]
        )
      end

      # Throw an exception if any param has an invalid value
      # If everything goes well it returns the params object
      def validate!(bitmap, params)
        # bitmap should be initialized
        validate_bitmap!(bitmap)

        # from_x should be valid
        validate_x!(bitmap, params.fetch(:x), 'X')

        # to_x should be valid
        validate_y!(bitmap, params.fetch(:y), 'Y')

        # color should be valid
        validate_color!(bitmap, params.fetch(:color), 'Color')

        params
      end
    end
  end # Commands
end # BitmapEditor
