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

  describe 'execute command I 8 8' do
    before(:each) { processor.execute!('I 8 8') }
    describe 'execute command V 2 1 6 K' do
      before(:each) { processor.execute!('V 2 1 6 K') }
      describe 'execute command V 6 3 6 K' do
        before(:each) { processor.execute!('V 6 3 6 K') }
        describe 'execute command H 2 6 6 K' do
          before(:each) { processor.execute!('H 2 6 6 K') }
          describe 'execute command H 3 4 1 A' do
            before(:each) { processor.execute!('H 3 4 1 A') }
            describe 'execute command L 5 2 B' do
              before(:each) { processor.execute!('L 5 2 B') }
              it 'bitmap array should be filled correctly' do
                expect(processor.bitmap.array).to match_array(
                  [
                    %w[0 K A A 0 0 0 0],
                    %w[0 K 0 0 B 0 0 0],
                    %w[0 K 0 0 0 K 0 0],
                    %w[0 K 0 0 0 K 0 0],
                    %w[0 K 0 0 0 K 0 0],
                    %w[0 K K K K K 0 0],
                    %w[0 0 0 0 0 0 0 0],
                    %w[0 0 0 0 0 0 0 0]
                  ]
                )
              end

              describe 'execute command F 4 4 X' do
                before(:each) { processor.execute!('F 4 4 X') }
                it 'bitmap array should be filled correctly' do
                  expect(processor.bitmap.array).to match_array(
                    [
                      %w[0 K A A 0 0 0 0],
                      %w[0 K X X B 0 0 0],
                      %w[0 K X X X K 0 0],
                      %w[0 K X X X K 0 0],
                      %w[0 K X X X K 0 0],
                      %w[0 K K K K K 0 0],
                      %w[0 0 0 0 0 0 0 0],
                      %w[0 0 0 0 0 0 0 0]
                    ]
                  )
                end
              end

              describe 'execute command F 1 3 X' do
                before(:each) { processor.execute!('F 1 3 X') }
                it 'bitmap array should be filled correctly' do
                  expect(processor.bitmap.array).to match_array(
                    [
                      %w[X K A A X X X X],
                      %w[X K 0 0 B X X X],
                      %w[X K 0 0 0 K X X],
                      %w[X K 0 0 0 K X X],
                      %w[X K 0 0 0 K X X],
                      %w[X K K K K K X X],
                      %w[X X X X X X X X],
                      %w[X X X X X X X X]
                    ]
                  )
                end
              end
            end
          end
        end
      end
    end
  end

  describe 'execute invalid command' do
    it 'should raise an error' do
      expect { processor.execute!('X') }.to raise_error(
        BitmapEditor::BitmapException
      )
    end
  end
end
