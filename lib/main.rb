$LOAD_PATH << './lib'
$LOAD_PATH << './lib/models'
require 'board'

state = [
  4,2,9,3,nil,nil,nil,6,8,
  nil,nil,nil,nil,nil,nil,nil,nil,3,
  nil,6,nil,nil,nil,nil,2,9,nil,
  nil,nil,nil,5,8,6,nil,nil,nil,
  3,8,6,nil,7,nil,4,nil,nil,
  7,nil,nil,nil,nil,2,nil,nil,nil,
  nil,nil,nil,nil,nil,nil,nil,nil,nil,
  nil,1,nil,7,nil,nil,nil,nil,nil,
  6,3,2,nil,nil,nil,nil,nil,1
]

board = Board.new(state)

count = 0
until board.solved? || count == 100
  board.cells.reject(&:filled?).each do |cell|
    if cell.possible_values.length == 1
      cell.value = cell.possible_values[0]
    end
  end

  board.blocks.each do |block|
    possible_value_counts = block.reject(&:filled?).map(&:possible_values).flatten.reduce({}) do |mem, v|
      mem[v] ||= 0
      mem[v] += 1
      mem
    end

    possible_value_counts.select { |_k, v| v == 1 }.each do |k, v|
      block.reject(&:filled?).detect { |cell| cell.possible_values.include?(k) }.value = k
    end
  end

  board.rows.each do |row|
    possible_value_counts = row.reject(&:filled?).map(&:possible_values).flatten.reduce({}) do |mem, v|
      mem[v] ||= 0
      mem[v] += 1
      mem
    end

    possible_value_counts.select { |_k, v| v == 1 }.each do |k, v|
      row.reject(&:filled?).detect { |cell| cell.possible_values.include?(k) }.value = k
    end
  end

  board.columns.each do |column|
    possible_value_counts = column.reject(&:filled?).map(&:possible_values).flatten.reduce({}) do |mem, v|
      mem[v] ||= 0
      mem[v] += 1
      mem
    end

    possible_value_counts.select { |_k, v| v == 1 }.each do |k, v|
      column.reject(&:filled?).detect { |cell| cell.possible_values.include?(k) }.value = k
    end
  end

  count += 1
end

board.rows.each { |row| puts row.inspect }

