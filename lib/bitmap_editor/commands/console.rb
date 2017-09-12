# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # Console command class
    class Console
      class << self
        def key
          'S'
        end
      end

      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute(bitmap)
        # Simply send bitmap array contents to console
        bitmap.array.each { |line| puts line.join }
        bitmap
      end

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - S
      def parse!(_bitmap, _string_command)
        # No params needed
        {
        }
      end
    end
  end # Commands
end # BitmapEditor
