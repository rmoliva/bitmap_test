# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::Initialize, type: :model do
  subject { command.execute!(nil) }
  let(:command) { BitmapEditor::Commands::Initialize.new(string_comand) }
  describe 'create an initialize command with I 5 6' do
    let(:string_comand) { 'I 5 6' }
    it 'should return an initial bitmap object' do
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
  end # create an initialize comand with I 5 6

  describe 'validations' do
    describe 'with a 0 width' do
      let(:string_comand) { 'I 0 6' }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end

    describe 'with a 0 height' do
      let(:string_comand) { 'I 5 0' }
      it 'should raise a BitmapException exception' do
        expect { subject }.to raise_error(BitmapEditor::BitmapException)
      end
    end
  end # validations
end
