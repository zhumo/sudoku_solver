require 'cell'
require 'block'
require 'row'
require 'column'

class Board

  def initialize
    @cells = [ Cell.new ] * ( 9 * 9 )
  end

  def blocks
    @blocks ||= @cells
    # Transpose method?
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
