# encoding: utf-8
# frozen_string_literal: true

# Load base class first
require File.join(__dir__, 'base')

module BitmapEditor
  module Commands
    # Clear command class
    class Clear < Base
      class << self
        def key
          'C'
        end

        def transformation
          BitmapEditor::Transformations::Clear
        end
      end

      protected

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - C
      def parse!(bitmap)
        # No params needed
        validate!(bitmap, {color: '0'})
      end

      # Throw an exception if any param has an invalid value
      # If everything goes well it returns the params object
      def validate!(bitmap, params)
        # bitmap should be initialized
        validate_bitmap!(bitmap)
        params
      end
    end
  end # Commands
end # BitmapEditor
