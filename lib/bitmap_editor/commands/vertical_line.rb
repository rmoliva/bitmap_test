# encoding: utf-8
# frozen_string_literal: true

# Load base class first
require File.join(__dir__, 'base')

module BitmapEditor
  module Commands
    # VerticalLine command class
    class VerticalLine < Base
      class << self
        def key
          'V'
        end

        def transformation
          BitmapEditor::Transformations::VerticalLine
        end
      end

      protected

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - V x from_y to_y color
      def parse!(bitmap)
        parts = @string_command.split(' ')
        validate!(
          bitmap,
          x: parts[1].to_i,
          from_y: parts[2].to_i,
          to_y: parts[3].to_i,
          color: parts[4]
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
        validate_y!(bitmap, params.fetch(:from_y), 'From Y')

        # y should be valid
        validate_y!(bitmap, params.fetch(:to_y), 'To Y')

        # color should be valid
        validate_color!(bitmap, params.fetch(:color), 'Color')

        params
      end
    end
  end # Commands
end # BitmapEditor
