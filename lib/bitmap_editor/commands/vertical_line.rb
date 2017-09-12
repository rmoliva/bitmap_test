# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # VerticalLine command class
    class VerticalLine
      class << self
        def key
          'V'
        end
      end

      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute(bitmap)
        params = parse!(bitmap, @string_command)
        BitmapEditor::Transformations::VerticalLine.perform(
          bitmap,
          params.fetch(:x),
          params.fetch(:from_y),
          params.fetch(:to_y),
          params.fetch(:color)
        )
      end

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - V x from_y to_y color
      def parse!(_bitmap, string_command)
        parts = string_command.split(' ')
        params = {
          x: parts[1].to_i,
          from_y: parts[2].to_i,
          to_y: parts[3].to_i,
          color: parts[4]
        }
        params
      end
    end
  end # Commands
end # BitmapEditor
