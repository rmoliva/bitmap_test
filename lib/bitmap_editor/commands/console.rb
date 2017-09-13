# encoding: utf-8
# frozen_string_literal: true

# Load base class first
require File.join(__dir__, 'base')

module BitmapEditor
  module Commands
    # Console command class
    class Console < Base
      class << self
        def key
          'S'
        end
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute!(bitmap)
        parse!(bitmap)

        # Simply send bitmap array contents to console
        bitmap.array.each { |line| puts line.join }
        bitmap
      end

      protected

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - S
      def parse!(bitmap)
        # No params needed
        validate!(bitmap, {})
      end

      # Throw an exception if any param has an invalid value
      # If everything goes well it returns the params object
      def validate!(bitmap, params)
        # bitmap should be initialized
        validate_bitmap!(bitmap)
      end
    end
  end # Commands
end # BitmapEditor
