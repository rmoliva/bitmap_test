# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  # Main BitmapEditor class
  class Main
    def initialize
      # Create the bitmap processor
      @processor = BitmapEditor::Processor.new
    end

    def run(file)
      if file.nil? || !File.exist?(file)
        puts 'please provide correct file'
        return
      end

      File.open(file).each_with_index do |line, index|
        execute_line(line.chomp, index + 1)
      end
    end

    protected

    def execute_line(string_command, line_number)
      @processor.execute!(string_command)
    rescue BitmapException => ex
      puts "ERROR processing Line: #{line_number}"
      puts "-> #{ex.message}"
    end
  end # Main
end # BitmapEditor
