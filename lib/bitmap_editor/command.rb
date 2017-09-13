# encoding: utf-8
# frozen_string_literal: true

module BitmapEditor
  # Comand factory class
  class Command
    class << self
      COMMANDS = [
        BitmapEditor::Commands::Clear,
        BitmapEditor::Commands::Console,
        BitmapEditor::Commands::HorizontalLine,
        BitmapEditor::Commands::Initialize,
        BitmapEditor::Commands::SetColor,
        BitmapEditor::Commands::VerticalLine
      ].freeze

      # Returns the command object associated to the passed string
      # command
      # This method is a command Factory
      def command(string_command)
        # Search for the command class that accepts the string command
        return unless (cmd = find_command(string_command))

        # Instantiate the command
        cmd.new(string_command)
      end

      protected

      def find_command(string_command)
        COMMANDS.detect do |command_class|
          command_class.key == string_command[0]
        end
      end # find_command
    end
  end # Command
end # BitmapEditor
