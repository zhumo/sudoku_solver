require 'models/row'
require 'models/cell'

RSpec.describe Row do
  let(:row_cells) { [Cell.new] * 9 }
  let(:row) { Row.new(row_cells) }
  
  subject { row }
end
