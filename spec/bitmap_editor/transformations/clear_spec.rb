# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Transformations::Clear, type: :model do
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

  describe 'clear array with an S' do
    before(:each) do
      BitmapEditor::Transformations::Clear.perform(bitmap, color: 'S')
    end

    it 'array should be correct' do
      expect(bitmap.array).to match_array(
        [
          %w[S S S],
          %w[S S S]
        ]
      )
    end
  end
end
