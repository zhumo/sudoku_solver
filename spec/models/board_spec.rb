require 'models/board'

RSpec.describe Board do
  describe 'initialization' do
    let(:board) { Board.new }

    describe 'cells attr' do
      subject { board.cells }

      it { should all( be_a Cell ) }
      it { should have_attributes(length: 81) }
    end
  end
end
