require 'models/cell'

RSpec.describe Cell do
  let(:cell) { Cell.new }

  describe 'without value' do
    subject { cell }

    it { should be_empty }
    it { should_not be_filled }
  end

  describe 'with value' do
    subject { cell }
    before { cell.value = 1 }

    it { should_not be_empty }
    it { should be_filled }
  end
end
