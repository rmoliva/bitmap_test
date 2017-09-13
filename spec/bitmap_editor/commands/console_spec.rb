# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::Console, type: :model do
  describe 'initialize the bitmap with S color' do
    let(:bitmap) { BitmapEditor::Bitmap.new(5, 6, 'S') }
    let(:command) { BitmapEditor::Commands::Console.new('S') }

    describe 'validations' do
      describe 'without_bitmap' do
        subject { command.execute!(nil) }
        it 'should raise a BitmapException exception' do
          expect { subject }.to raise_error(BitmapEditor::BitmapException)
        end
      end # without_bitmap
    end
  end # create an clear comand with C
end
