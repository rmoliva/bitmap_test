# encoding: utf-8
# frozen_string_literal: true

# Load base class first
require File.join(__dir__, 'base')

module BitmapEditor
  module Commands
    # Initialize command class
    class Initialize < Base
      class << self
        def key
          'I'
        end
      end

      # Execute the command over the passed bitmap object
      # returns the transformed bitmap object
      def execute!(bitmap)
        params = parse!(bitmap)
        BitmapEditor::Transformations::Initialize.perform(params)
      end

      protected

      # Given an string command it returns an object with the
      # value of each param.
      # It also throws an exception if there is an incorrect param
      # - I width height
      def parse!(_bitmap)
        parts = @string_command.split(' ')
        params = {
          width: parts[1].to_i,
          height: parts[2].to_i
        }
        params
      end
    end
  end # Commands
end # BitmapEditor
