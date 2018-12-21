require 'models/board'

RSpec.describe Board do
  describe 'initialization' do
    let(:board) { Board.new }

    its(:cells) { should have_length(81) }
    # its(:cells) { should_be all
  end
end
