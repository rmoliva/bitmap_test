# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::VerticalLine, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }

  describe 'create an horizontal line command with V 2 3 6 W' do
    let(:command) { BitmapEditor::Commands::VerticalLine.new('V 2 3 6 W') }

    subject { command.execute(bitmap) }

    it 'should return a correct bitmap object' do
      expect(subject.array).to match_array(
        [
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 W 0 0 0],
          %w[0 W 0 0 0],
          %w[0 W 0 0 0],
          %w[0 W 0 0 0]
        ]
      )
    end
  end # create an horizontal line comand with V 2 3 6 W
end
