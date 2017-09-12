# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::HorizontalLine, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }

  describe 'create an horizontal line command with H 3 5 2 Z' do
    let(:command) { BitmapEditor::Commands::HorizontalLine.new('H 3 5 2 Z') }

    subject { command.execute(bitmap) }

    it 'should return a correct bitmap object' do
      expect(subject.array).to match_array(
        [
          %w[0 0 0 0 0],
          %w[0 0 Z Z Z],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0]
        ]
      )
    end
  end # create an horizontal line comand with H 3 5 2 Z
end
