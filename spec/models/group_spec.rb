require 'models/group'
require 'models/cell'

RSpec.describe Group do
  let(:group_cells) { [Cell.new] * 9 }
  let(:group) { Group.new(group_cells) }

  subject { group }
end
