# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # Clear command class
    class Clear
      class << self
        def key
          'C'
        end
      end

      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute(bitmap)
        # Always clear with color 0
        BitmapEditor::Transformations::Clear.perform(bitmap, '0')
      end

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - C
      def parse!(_bitmap, _string_command)
        # No params needed
        {
        }
      end
    end
  end # Commands
end # BitmapEditor
