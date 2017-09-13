# encoding: utf-8
# frozen_string_literal: true

RSpec.describe BitmapEditor::Processor, type: :model do
  let(:processor) { BitmapEditor::Processor.new }

  describe 'execute command I 5 6' do
    before(:each) { processor.execute!('I 5 6') }
    describe 'execute command L 1 3 A' do
      before(:each) { processor.execute!('L 1 3 A') }
      describe 'execute command V 2 3 6 W' do
        before(:each) { processor.execute!('V 2 3 6 W') }
        describe 'execute command H 3 5 2 Z' do
          before(:each) { processor.execute!('H 3 5 2 Z') }
          it 'bitmap array should be filled correctly' do
            expect(processor.bitmap.array).to match_array(
              [
                %w[0 0 0 0 0],
                %w[0 0 Z Z Z],
                %w[A W 0 0 0],
                %w[0 W 0 0 0],
                %w[0 W 0 0 0],
                %w[0 W 0 0 0]
              ]
            )
          end
        end # execute command H 3 5 2 Z
      end # execute command V 2 3 6 W
    end # execute command L 1 3 A
  end # execute command I 5 6

  describe 'execute invalid command' do
    it 'should raise an error' do
      expect { processor.execute!('X') }.to raise_error(
        BitmapEditor::BitmapException
      )
    end
  end
end
