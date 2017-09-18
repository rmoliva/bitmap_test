# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Commands::HorizontalLine, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(6, 6) }
  let(:command) { BitmapEditor::Commands::Fill.new(string_command) }
  subject { command.execute!(bitmap) }

  describe 'validations' do
    describe 'without_bitmap' do
      let(:string_command) { 'F 4 4 X' }
      subject { command.execute!(nil) }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # without_bitmap

    describe 'color' do
      let(:string_command) { 'F 4 4 XX' }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # color

    describe 'x' do
      describe 'with a 0 value' do
        let(:string_command) { 'F 0 4 X' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than width' do
        let(:string_command) { 'F 7 4 X' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # from_x

    describe 'y' do
      describe 'with a 0 value' do
        let(:string_command) { 'F 3 0 X' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than height' do
        let(:string_command) { 'F 3 7 X' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # y
  end # validations
end
