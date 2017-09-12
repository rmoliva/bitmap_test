# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::SetColor, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }

  describe 'create an set color command with L 1 3 A' do
    let(:command) { BitmapEditor::Commands::SetColor.new('L 1 3 A') }

    subject { command.execute(bitmap) }

    it 'should return a correct bitmap object' do
      expect(subject.array).to match_array(
        [
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[A 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0]
        ]
      )
    end
  end # create an set color comand with L 1 3 A
end
