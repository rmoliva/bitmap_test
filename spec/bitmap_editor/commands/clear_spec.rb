# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::Clear, type: :model do
  describe 'initialize the bitmap with S color' do
    let(:bitmap) { BitmapEditor::Bitmap.new(5, 6, 'S') }

    it 'should be filled with S' do
      expect(bitmap.array).to match_array(
        [
          %w[S S S S S],
          %w[S S S S S],
          %w[S S S S S],
          %w[S S S S S],
          %w[S S S S S],
          %w[S S S S S]
        ]
      )
    end

    describe 'create an clear command with C' do
      let(:command) { BitmapEditor::Commands::Clear.new('C') }

      subject { command.execute(bitmap) }

      it 'should return a correct bitmap object' do
        expect(subject.array).to match_array(
          [
            %w[0 0 0 0 0],
            %w[0 0 0 0 0],
            %w[0 0 0 0 0],
            %w[0 0 0 0 0],
            %w[0 0 0 0 0],
            %w[0 0 0 0 0]
          ]
        )
      end
    end
  end # create an clear comand with C
end
