# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # Initialize command class
    class Initialize
      class << self
        def key
          'I'
        end
      end

      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute(bitmap)
        params = parse!(bitmap, @string_command)
        BitmapEditor::Transformations::Initialize.perform(
          params.fetch(:width),
          params.fetch(:height)
        )
      end

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - I width height
      def parse!(_bitmap, string_command)
        parts = string_command.split(' ')
        params = {
          width: parts[1].to_i,
          height: parts[2].to_i
        }
        params
      end
    end
  end # Commands
end # BitmapEditor
