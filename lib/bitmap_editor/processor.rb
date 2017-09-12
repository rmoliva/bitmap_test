# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  # Processor BitmapEditor class
  class Processor
    attr_reader :bitmap

    def initialize
      # bitmap object initially is nil till its initialized
      @bitmap = nil
    end

    # Execute the command received (line of a command file)
    def execute(string_command)
      # Find the command object responsible of the string command
      command = BitmapEditor::Commands::Base.command(string_command)

      unless command
        raise(
          BitmapEditor::BitmapException,
          "Command: '#{string_command}' not recognized"
        )
      end

      # Execute the command, saving the result in the bitmap object
      @bitmap = command.execute(@bitmap)
    end
  end
end
