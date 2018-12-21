require 'models/cell'
require 'models/block'
require 'models/row'
require 'models/column'

class Board

  attr_reader :cells

  def initialize
    @cells = ( 9 * 9 ).times.map { |n| Cell.new }
  end

  def blocks
    @blocks ||= @cells.each_slice(3).each_slice(3).to_a.transpose.flatten(1).each_slice(3).map(&:flatten).sort { |a,b| }.map { |block_cells| p block_cells; Block.new(block_cells) }
  end

  def block(n)
    @blocks[n]
  end

  def rows
    @rows ||= @cells.each_slice(9).map { |row_cells| Row.new(row_cells) }
  end

  def row(n)
    @row[n]
  end

  def columns
    @columns ||= @cells.each_slice(9).to_a.transpose.map { |column_cells| Column.new(column_cells) }
  end

  def column(n)
    @columns[n]
  end
end
