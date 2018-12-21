require 'models/group'
require 'models/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = (9 * 9).times.map { |n| cell = Cell.new(n) }
  end

  def blocks
    @blocks ||= begin
      blocks = 9.times.map { |n| Group.new }

      cells.each do |cell|
        block = blocks[cell.block_number]
        cell.block = block
        block << cell
      end

      blocks
    end
  end

  def rows
    @rows ||= begin
      rows = 9.times.map { |n| Group.new }

      cells.each do |cell|
        row = rows[cell.row_number]
        cell.row = row
        row << cell
      end

      rows
    end
  end

  def columns
    @columns ||= begin
      columns = 9.times.map { |n| Group.new }

      cells.each do |cell|
        column = columns[cell.column_number]
        cell.column = column
        column << cell
      end

      columns
    end
  end
end
