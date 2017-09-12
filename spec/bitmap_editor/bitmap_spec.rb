# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Bitmap, type: :model do
  describe 'create with invalid params' do
    describe 'with a zero with' do
      it 'should rise an exception' do
        expect { BitmapEditor::Bitmap.new(0, 1) }.to raise_exception(
          BitmapEditor::BitmapException
        )
      end
    end

    describe 'with a zero height' do
      it 'should rise an exception' do
        expect { BitmapEditor::Bitmap.new(1, 0) }.to raise_exception(
          BitmapEditor::BitmapException
        )
      end
    end
  end

  describe '7x5 bitmap' do
    let(:width) { 7 }
    let(:height) { 5 }
    let(:bitmap) { BitmapEditor::Bitmap.new(width, height) }

    it 'array should be initialized correctly' do
      expect(bitmap.array).to match_array(
        [
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0],
          %w[0 0 0 0 0 0 0]
        ]
      )
    end

    describe 'fill with S' do
      before(:each) do
        bitmap.fill('S')
      end

      it 'should be filled correctly' do
        expect(bitmap.array).to match_array(
          [
            %w[S S S S S S S],
            %w[S S S S S S S],
            %w[S S S S S S S],
            %w[S S S S S S S],
            %w[S S S S S S S]
          ]
        )
      end
    end

    it 'width should return 7' do
      expect(bitmap.width).to eql(width)
    end

    it 'height should return 5' do
      expect(bitmap.height).to eql(height)
    end

    describe 'set color C on 5, 3' do
      before(:each) do
        bitmap.set_color(5, 1, 'C')
      end

      it 'array should be correct' do
        expect(bitmap.array).to eql(
          [
            %w[0 0 0 0 C 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0]
          ]
        )
      end
    end

    describe 'set color X on 3, 5' do
      before(:each) do
        bitmap.set_color(3, 5, 'X')
      end

      it 'array should be correct' do
        expect(bitmap.array).to match_array(
          [
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 X 0 0 0 0]
          ]
        )
      end
    end

    describe 'set color H on 3, 2' do
      before(:each) do
        bitmap.set_color(3, 2, 'H')
      end

      it 'array should be correct' do
        expect(bitmap.array).to match_array(
          [
            %w[0 0 0 0 0 0 0],
            %w[0 0 H 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0],
            %w[0 0 0 0 0 0 0]
          ]
        )
      end
    end

    describe 'valid_position?' do
      describe 'width' do
        it 'below 1 should return false' do
          expect(
            bitmap.valid_position?(0, 1)
          ).to be_falsey
        end

        it '1 should return true' do
          expect(
            bitmap.valid_position?(1, 1)
          ).to be_truthy
        end

        it 'width should return true' do
          expect(
            bitmap.valid_position?(width, 1)
          ).to be_truthy
        end

        it 'over width should return false' do
          expect(
            bitmap.valid_position?(width + 1, 1)
          ).to be_falsey
        end
      end

      describe 'height' do
        it 'below 1 should return false' do
          expect(
            bitmap.valid_position?(1, 0)
          ).to be_falsey
        end

        it '1 should return true' do
          expect(
            bitmap.valid_position?(1, 1)
          ).to be_truthy
        end

        it 'height should return true' do
          expect(
            bitmap.valid_position?(1, height)
          ).to be_truthy
        end

        it 'over height should return false' do
          expect(
            bitmap.valid_position?(1, height + 1)
          ).to be_falsey
        end
      end
    end # valid_position?
  end # 7x5 bitmap
end
