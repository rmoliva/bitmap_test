# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  module Transformations
    # Fill transformation class
    class Fill
      # Pixel class to easy fill algorithm
      class Pixel
        attr_accessor :x, :y
        def initialize(x, y)
          @x = x
          @y = y
        end
      end

      class << self
        # Fills a region with a color, started on a defined position
        # params
        # - x
        # - y
        # - color : defaults to '0'
        def perform(bitmap, params)
          fill(
            bitmap,
            Pixel.new(params.fetch(:x), params.fetch(:y)),
            params.fetch(:color)
          )
          bitmap
        end

        protected

        def fill(bitmap, pixel, color)
          current_color = bitmap.get_color(pixel.x, pixel.y)
          queue = [pixel]
          until queue.empty?
            p = queue.shift
            next unless expected_color?(bitmap, p, current_color)

            west = find_border(bitmap, p, current_color, :west)
            east = find_border(bitmap, p, current_color, :east)
            draw_line(bitmap, west, east, color)
            q = west
            while q.x <= east.x
              %I[north south].each do |direction|
                n = neighbour(q, direction)
                queue.push(n) if expected_color?(bitmap, n, current_color)
              end
              q = neighbour(q, :east)
            end
          end
        end

        def expected_color?(bitmap, pixel, color)
          bitmap.get_color(pixel.x, pixel.y) == color
        end

        def draw_line(bitmap, pixel1, pixel2, color)
          (pixel1.x..pixel2.x).each do |x|
            (pixel1.y..pixel2.y).each do |y|
              bitmap.set_color(x, y, color)
            end
          end
        end

        def neighbour(pixel, direction)
          coordinates = {
            north: Pixel.new(pixel.x, pixel.y - 1),
            south: Pixel.new(pixel.x, pixel.y + 1),
            east: Pixel.new(pixel.x + 1, pixel.y),
            west: Pixel.new(pixel.x - 1, pixel.y)
          }
          coordinates[direction]
        end

        def find_border(bitmap, pixel, color, direction)
          nextp = neighbour(pixel, direction)
          while expected_color?(bitmap, nextp, color)
            pixel = nextp
            nextp = neighbour(pixel, direction)
          end
          pixel
        end
      end
    end
  end # Transformations
end # BitmapEditor
