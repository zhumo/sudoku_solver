require 'models/group'
require 'models/cell'

class Board

  attr_reader :cells

  def initialize(state=[])
    @cells = (9 * 9).times.map { |n| cell = Cell.new(n, value: state[n]) }
    @cells.each do |cell|
      row = rows[cell.row_number]
      cell.row = row
      row << cell

      column = columns[cell.column_number]
      cell.column = column
      column << cell

      block = blocks[cell.block_number]
      cell.block = block
      block << cell
    end
  end

  def blocks
    @blocks ||= blocks = 9.times.map { |n| Group.new }
  end

  def rows
    @rows ||= rows = 9.times.map { |n| Group.new }
  end

  def columns
    @columns ||= columns = 9.times.map { |n| Group.new }
  end

  def solved?
    cells.all?(&:filled?)
  end
end
