# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Transformations::Fill, type: :model do
  let(:width) { 8 }
  let(:height) { 8 }
  let(:bitmap) { BitmapEditor::Bitmap.new(width, height) }

  before(:each) do
    BitmapEditor::Transformations::VerticalLine.perform(
      bitmap,
      x: 2,
      from_y: 1,
      to_y: 6,
      color: 'K'
    )
    BitmapEditor::Transformations::VerticalLine.perform(
      bitmap,
      x: 6,
      from_y: 3,
      to_y: 6,
      color: 'K'
    )
    BitmapEditor::Transformations::HorizontalLine.perform(
      bitmap,
      from_x: 2,
      to_x: 6,
      y: 6,
      color: 'K'
    )
    BitmapEditor::Transformations::HorizontalLine.perform(
      bitmap,
      from_x: 3,
      to_x: 4,
      y: 1,
      color: 'A'
    )
    BitmapEditor::Transformations::SetColor.perform(
      bitmap,
      x: 5,
      y: 2,
      color: 'B'
    )
  end

  it 'should be prepared correctly' do
    expect(bitmap.array).to match_array(
      [
        %w[0 K A A 0 0 0 0],
        %w[0 K 0 0 B 0 0 0],
        %w[0 K 0 0 0 K 0 0],
        %w[0 K 0 0 0 K 0 0],
        %w[0 K 0 0 0 K 0 0],
        %w[0 K K K K K 0 0],
        %w[0 0 0 0 0 0 0 0],
        %w[0 0 0 0 0 0 0 0]
      ]
    )
  end

  describe 'with parameters in the middle' do
    before(:each) do
      BitmapEditor::Transformations::Fill.perform(
        bitmap,
        x: 4,
        y: 4,
        color: 'X'
      )
    end

    it 'should be filled correctly' do
      expect(bitmap.array).to match_array(
        [
          %w[0 K A A 0 0 0 0],
          %w[0 K X X B 0 0 0],
          %w[0 K X X X K 0 0],
          %w[0 K X X X K 0 0],
          %w[0 K X X X K 0 0],
          %w[0 K K K K K 0 0],
          %w[0 0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0 0]
        ]
      )
    end
  end

  describe 'with parameters in the border' do
    before(:each) do
      BitmapEditor::Transformations::Fill.perform(
        bitmap,
        x: 2,
        y: 3,
        color: 'X'
      )
    end

    it 'should be filled correctly' do
      expect(bitmap.array).to match_array(
        [
          %w[0 X A A 0 0 0 0],
          %w[0 X 0 0 B 0 0 0],
          %w[0 X 0 0 0 X 0 0],
          %w[0 X 0 0 0 X 0 0],
          %w[0 X 0 0 0 X 0 0],
          %w[0 X X X X X 0 0],
          %w[0 0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0 0]
        ]
      )
    end
  end

  describe 'with parameters in the outside' do
    before(:each) do
      BitmapEditor::Transformations::Fill.perform(
        bitmap,
        x: 1,
        y: 3,
        color: 'X'
      )
    end

    it 'should be filled correctly' do
      expect(bitmap.array).to match_array(
        [
          %w[X K A A X X X X],
          %w[X K 0 0 B X X X],
          %w[X K 0 0 0 K X X],
          %w[X K 0 0 0 K X X],
          %w[X K 0 0 0 K X X],
          %w[X K K K K K X X],
          %w[X X X X X X X X],
          %w[X X X X X X X X]
        ]
      )
    end
  end
end
