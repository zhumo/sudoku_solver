class Cell
  extend Forwardable

  attr_accessor :value

  def_delegators :value, :nil?
  alias empty? nil?

  def filled?
    !empty?
  end
end
