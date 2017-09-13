# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Commands
    # Base command class
    class Base
      def initialize(string_command)
        @string_command = string_command
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object.
      # Normaly each command has only one transformation
      # associated, for special commands just overload.
      def execute!(bitmap)
        params = parse!(bitmap)
        self.class.transformation.perform(bitmap, params)
      end

      protected

      # Check that the bitmap exists
      def validate_bitmap!(bitmap)
        return if bitmap

        raise BitmapException, "Bitmap array not initialized"
      end

      def validate_x!(bitmap, value, value_name)
        return if bitmap.valid_x?(value)
        raise_value_exception!(value, value_name)
      end

      def validate_y!(bitmap, value, value_name)
        return if bitmap.valid_y?(value)
        raise_value_exception!(value, value_name)
      end

      def raise_value_exception!(value, value_name)
        raise BitmapException, "#{value_name} value is not valid ('#{value}')"
      end
    end
  end # Commands
end # BitmapEditor
