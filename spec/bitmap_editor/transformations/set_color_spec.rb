# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Transformations::SetColor, type: :model do
  let(:width) { 3 }
  let(:height) { 2 }
  let(:bitmap) { BitmapEditor::Bitmap.new(width, height) }

  it 'array should be initialized correctly' do
    expect(bitmap.array).to match_array(
      [
        %w[0 0 0],
        %w[0 0 0]
      ]
    )
  end

  describe 'set color S at 2, 2' do
    before(:each) do
      BitmapEditor::Transformations::SetColor.perform(
        bitmap,
        x: 2,
        y: 2,
        color: 'S'
      )
    end

    it 'array should be correct' do
      expect(bitmap.array).to match_array(
        [
          %w[0 0 0],
          %w[0 S 0]
        ]
      )
    end
  end
end
