# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Commands::VerticalLine, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }
  let(:command) { BitmapEditor::Commands::VerticalLine.new(string_command) }
  subject { command.execute!(bitmap) }

  describe 'create an horizontal line command with V 2 3 6 W' do
    let(:string_command) { 'V 2 3 6 W' }
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

  describe 'validations' do
    describe 'without_bitmap' do
      let(:string_command) { 'V 2 3 6 W' }
      subject { command.execute!(nil) }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # without_bitmap

    describe 'color' do
      let(:string_command) { 'V 2 3 6 WW' }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # color

    describe 'x' do
      describe 'with a 0 value' do
        let(:string_command) { 'V 0 3 6 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than width' do
        let(:string_command) { 'V 6 3 6 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # x

    describe 'from_y' do
      describe 'with a 0 value' do
        let(:string_command) { 'V 2 0 6 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than height' do
        let(:string_command) { 'V 2 7 6 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # from_x

    describe 'to_y' do
      describe 'with a 0 value' do
        let(:string_command) { 'V 2 3 0 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than height' do
        let(:string_command) { 'V 2 3 7 W' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # to_x
  end # validations
end
