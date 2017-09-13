# encoding: utf-8
# frozen_string_literal: true

require 'spec_base'

RSpec.describe BitmapEditor::Transformations::Initialize, type: :model do
  let(:width) { 3 }
  let(:height) { 2 }

  describe 'initialize array' do
    subject do
      BitmapEditor::Transformations::Initialize.perform(
        width: width,
        height: height,
        color: 'S'
      )
    end

    it 'array should be correct' do
      expect(subject.array).to match_array(
        [
          %w[S S S],
          %w[S S S]
        ]
      )
    end
  end
end
