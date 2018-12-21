require 'pry'

class Cell

  attr_accessor :value, :row, :column, :block
  attr_reader :index

  def initialize(index, value: nil)
    @index = index
    @value = value
  end

  def empty?
    value.nil?
  end

  def filled?
    !empty?
  end

  def row_number
    index / 9
  end

  def column_number
    index % 9
  end

  def block_number
    column_number / 3 + (row_number / 3) * 3
  end

  def possible_values
    (1..9).to_a - row.values - column.values - block.values
  end

  def inspect
    value || '-'
  end
end
