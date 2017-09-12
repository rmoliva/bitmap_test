# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # HorizontalLine command class
    class HorizontalLine
      class << self
        def key
          'H'
        end
      end

      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute(bitmap)
        params = parse!(bitmap, @string_command)
        BitmapEditor::Transformations::HorizontalLine.perform(
          bitmap,
          params.fetch(:from_x),
          params.fetch(:to_x),
          params.fetch(:y),
          params.fetch(:color)
        )
      end

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - H from_x to_x y color
      def parse!(_bitmap, string_command)
        parts = string_command.split(' ')
        params = {
          from_x: parts[1].to_i,
          to_x: parts[2].to_i,
          y: parts[3].to_i,
          color: parts[4]
        }
        params
      end
    end
  end # Commands
end # BitmapEditor
