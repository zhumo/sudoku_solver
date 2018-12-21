require 'models/board'

RSpec.describe Board do
  let(:board) { Board.new }
  subject { board }

  describe 'initialization' do
    describe 'cells attr' do
      subject { board.cells }

      it { should all( be_a Cell ) }
      it { should have_attributes(length: 81) }
    end

    describe 'rows' do
      subject { board.rows }
      it { should have_attributes(length: 9) }
      it { should all(have_attributes(length: 9 )) }

      it 'assigns cells to rows' do
        9.times do |n|
          row_cell_indices = 9*n..(9*n + 8)
          expect(board.cells.values_at(*row_cell_indices)).to match_array(board.rows[n])
        end
      end
    end

    describe 'columns' do
      subject { board.columns }
      it { should have_attributes(length: 9) }
      it { should all(have_attributes(length: 9)) }

      it 'assigns cells to columns' do
        9.times do |n|
          column_cell_indices = (0..8).map { |i| i *  9 + n }
          expect(board.cells.values_at(*column_cell_indices)).to match_array(board.columns[n])
        end
      end
    end

    describe 'blocks' do
      subject { board.blocks }
      it { should have_attributes(length: 9) }
      it { should all(have_attributes(length: 9)) }

      it 'assigns cells to blocks' do
        base_cell_indices = [
          0,1,2,
          9,10,11,
          18,19,20,
        ]
        9.times do |n|
          block_row_number = n / 3
          block_col_number = n % 3
          block_cell_indices = base_cell_indices.map do |i|
            i + (3 * block_col_number) + (9 * 3 * block_row_number)
          end
          expect(board.cells.values_at(*block_cell_indices)).to match_array(board.blocks[n])
          # expect((0..80).to_a.values_at(*block_cell_indices)).to match_array(board.blocks[n])
        end
      end
    end
  end
end
