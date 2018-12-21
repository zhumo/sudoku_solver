require 'cell'

class Board

  def initialize
    @cells = [ Cell.new ] * 81
  end

  def blocks

  end

  def block(n)
    @blocks[n]
  end

  def rows

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
