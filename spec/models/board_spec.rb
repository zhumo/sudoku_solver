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
        expect(board.cells).to eq(board.rows.flatten)
      end
    end
  end
end
