require 'models/group'
require 'models/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = ( 9 * 9 ).times.map { |n| Cell.new(n) }
  end

  def blocks
    @blocks ||= @cells.sort {|a,b| a.block_number <=> b.block_number }.each_slice(9).map do |block_cells|
      Group.new(block_cells)
    end
  end

  def block(n)
    @blocks[n]
  end

  def rows
    @rows ||= @cells.each_slice(9).map do |row_cells|
      Group.new(row_cells)
    end
  end

  def row(n)
    @row[n]
  end

  def columns
    @columns ||= @cells.each_slice(9).to_a.transpose.map do |column_cells| 
      Group.new(column_cells)
    end
  end

  def column(n)
    @columns[n]
  end
end
