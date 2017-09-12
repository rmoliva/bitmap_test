# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  # Main BitmapEditor class
  class Main
    def run(file)
      if file.nil? || !File.exist?(file)
        puts 'please provide correct file'
        return
      end

      File.open(file).each do |line|
        line = line.chomp
        case line
        when 'S'
          puts 'There is no image'
        else
          puts 'unrecognised command :('
        end
      end
    end
  end # Main
end # BitmapEditor
