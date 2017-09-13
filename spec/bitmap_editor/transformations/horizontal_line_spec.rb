# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Transformations::HorizontalLine, type: :model do
  let(:width) { 7 }
  let(:height) { 8 }
  let(:bitmap) { BitmapEditor::Bitmap.new(width, height) }

  it 'array should be initialized correctly' do
    expect(bitmap.array).to match_array(
      [
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0]
      ]
    )
  end

  describe 'draw a vertical line on column 3 from 2 to 6' do
    before(:each) do
      BitmapEditor::Transformations::HorizontalLine.perform(
        bitmap,
        from_x: 2,
        to_x: 5,
        y: 6,
        color: 'S'
      )
    end

    it 'array should be correct' do
      expect(bitmap.array).to match_array(
        [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 S S S S 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0]
        ]
      )
    end
  end
end
