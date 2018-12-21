require 'cell'
require 'row'

class Board

  def initialize
    @cells = [ Cell.new ] * ( 9 * 9 )
  end

  def blocks

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

  end

  def column(n)
    @columns[n]
  end
end
