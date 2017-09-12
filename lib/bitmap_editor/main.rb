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

      # Create the bitmap processor
      processor = BitmapEditor::Processor.new
      File.open(file).each { |line| processor.execute(line.chomp) }
    end
  end # Main
end # BitmapEditor
