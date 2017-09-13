# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Commands::SetColor, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }
  let(:command) { BitmapEditor::Commands::SetColor.new(string_command) }
  subject { command.execute!(bitmap) }

  describe 'create an set color command with L 1 3 A' do
    let(:string_command) { 'L 1 3 A' }

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

  describe 'validations' do
    describe 'without_bitmap' do
      let(:string_command) { 'L 1 3 A' }
      subject { command.execute!(nil) }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # without_bitmap

    describe 'x' do
      describe 'with a 0 value' do
        let(:string_command) { 'L 0 3 A' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than width' do
        let(:string_command) { 'L 6 3 A' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # x

    describe 'y' do
      describe 'with a 0 value' do
        let(:string_command) { 'L 1 0 A' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than height' do
        let(:string_command) { 'L 1 7 A' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # y
  end # validations
end
