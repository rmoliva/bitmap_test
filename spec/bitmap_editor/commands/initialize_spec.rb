# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Commands::Initialize, type: :model do
  describe 'create an initialize command with I 5 6' do
    let(:command) { BitmapEditor::Commands::Initialize.new('I 5 6') }
    subject { command.execute(nil) }

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
end
