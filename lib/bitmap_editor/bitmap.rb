# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  # Main Bitmap class
  # - This class is responably of mantaining the bitmap array
  class Bitmap
    attr_reader :array

    # Bitmap constructor. Sets the bitmap dimensions to create
    # an empty board
    # width and height must be greater than 0
    def initialize(initial_width, initial_height, initial_color = '0')
      # Check correct params
      raise BitmapException, 'Invalid height' if initial_height <= 0
      raise BitmapException, 'Invalid width' if initial_width <= 0

      # Create array
      @array = Array.new(initial_height) do
        Array.new(initial_width, initial_color)
      end
    end

    # Returns the width of the bitmap
    def width
      # Get the size of the first row of the array
      @array[0].size
    end

    # Returns the height of the bitmap
    def height
      # Get the size of the main array
      @array.size
    end

    # This function fills all the board with an specific color
    def fill(color)
      @array = Array.new(height) do
        Array.new(width, color)
      end
    end

    # This function changes the value at a certain position
    # x and y goes from 1 to the bitmap width and height
    def set_color(x, y, color)
      # Put color if coordinates are ok
      @array[y - 1][x - 1] = color if valid_position?(x, y)
    end

    # The following function checks if the passed coordinates are correct
    # x and y goes from 1 to the bitmap width and height
    def valid_position?(x, y)
      return false unless valid_x?(x)
      return false unless valid_y?(y)
      true
    end

    protected

    def valid_x?(x)
      x >= 1 && x <= width
    end

    def valid_y?(y)
      y >= 1 && y <= height
    end
  end # Bitmap
end # BitmapEditor
