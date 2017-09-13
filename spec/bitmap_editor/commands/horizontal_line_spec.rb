# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Commands::HorizontalLine, type: :model do
  let(:bitmap) { BitmapEditor::Bitmap.new(5, 6) }
  let(:command) { BitmapEditor::Commands::HorizontalLine.new(string_command) }
  subject { command.execute!(bitmap) }

  describe 'create an horizontal line command with H 3 5 2 Z' do
    let(:string_command) { 'H 3 5 2 Z' }
    it 'should return a correct bitmap object' do
      expect(subject.array).to match_array(
        [
          %w[0 0 0 0 0],
          %w[0 0 Z Z Z],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0],
          %w[0 0 0 0 0]
        ]
      )
    end
  end # create an horizontal line comand with H 3 5 2 Z

  describe 'validations' do
    describe 'without_bitmap' do
      let(:string_command) { 'H 3 5 2 Z' }
      subject { command.execute!(nil) }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end # without_bitmap

    describe 'from_x' do
      describe 'with a 0 value' do
        let(:string_command) { 'H 0 5 2 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than width' do
        let(:string_command) { 'H 6 5 2 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # from_x

    describe 'to_x' do
      describe 'with a 0 value' do
        let(:string_command) { 'H 3 0 2 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than width' do
        let(:string_command) { 'H 3 6 2 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # to_x

    describe 'y' do
      describe 'with a 0 value' do
        let(:string_command) { 'H 3 5 0 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end

      describe 'greater than height' do
        let(:string_command) { 'H 3 5 7 Z' }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end
    end # y
  end # validations
end
