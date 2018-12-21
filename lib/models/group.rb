class Group
  include Enumerable
  extend Forwardable

  attr_reader :cells

  def_delegators :cells, :<<, :each, :length

  def initialize
    @cells = []
  end

  def values
    cells.map(&:value).compact.uniq
  end

end
