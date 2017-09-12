# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::Base, type: :model do
  describe 'command' do
    describe 'with a I M N' do
      it 'should return the Initialize command' do
        expect(
          BitmapEditor::Commands::Base.command('I 2 2').class
        ).to eql(
          BitmapEditor::Commands::Initialize
        )
      end
    end

    describe 'with a C' do
      it 'should return the Clear command' do
        expect(
          BitmapEditor::Commands::Base.command('C').class
        ).to eql(
          BitmapEditor::Commands::Clear
        )
      end
    end

    describe 'with a L X Y C' do
      it 'should return the SetColor command' do
        expect(
          BitmapEditor::Commands::Base.command('L 2 2 S').class
        ).to eql(
          BitmapEditor::Commands::SetColor
        )
      end
    end

    describe 'with a V X Y1 Y2 C' do
      it 'should return the VerticalLine command' do
        expect(
          BitmapEditor::Commands::Base.command('V 2 3 4 C').class
        ).to eql(
          BitmapEditor::Commands::VerticalLine
        )
      end
    end

    describe 'with a H X1 X2 Y C' do
      it 'should return the HorizontalLine command' do
        expect(
          BitmapEditor::Commands::Base.command('H 2 4 3 C').class
        ).to eql(
          BitmapEditor::Commands::HorizontalLine
        )
      end
    end

    describe 'with a S' do
      it 'should return the Console command' do
        expect(
          BitmapEditor::Commands::Base.command('S').class
        ).to eql(
          BitmapEditor::Commands::Console
        )
      end
    end
  end # command
end # BitmapEditor::Commands::Base
