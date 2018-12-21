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
          expect(board.cells[9*n..(9*n + 8)]).to match_array(board.rows[n])
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
  end
end
