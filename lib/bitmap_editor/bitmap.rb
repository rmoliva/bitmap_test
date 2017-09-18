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
      check_valid_size!(initial_width, initial_height)
      check_valid_color!(initial_color)

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

    # This function clear all the board with an specific color
    def clear(color)
      @array = Array.new(height) do
        Array.new(width, color)
      end
    end

    # This function changes the value at a certain position
    # x and y goes from 1 to the bitmap width and height
    def set_color(x, y, color)
      # Put color if coordinates are ok
      return if !valid_x?(x) || !valid_y?(y) || !valid_color?(color)
      @array[y - 1][x - 1] = color
    end

    # This function returns the color at a certain position
    def get_color(x, y)
      return if !valid_x?(x) || !valid_y?(y)
      @array[y - 1][x - 1]
    end

    # The following function checks if the passed x coordinate is correct
    # x goes from 1 to the bitmap width
    def valid_x?(x)
      x >= 1 && x <= width
    end

    # The following function checks if the passed y coordinate is correct
    # y goes from 1 to the bitmap height
    def valid_y?(y)
      y >= 1 && y <= height
    end

    # The following function checks if the passed color is correct
    def valid_color?(color)
      color.length == 1
    end

    protected

    def check_valid_size!(width, height)
      # Check correct params
      raise BitmapException, 'Invalid height' if height <= 0
      raise BitmapException, 'Invalid width' if width <= 0
      raise BitmapException, 'Invalid height' if height > 250
      raise BitmapException, 'Invalid width' if width > 250
    end

    def check_valid_color!(color)
      return if valid_color?(color)
      raise BitmapException, "Invalid color ('#{color}')'"
    end
  end # Bitmap
end # BitmapEditor
