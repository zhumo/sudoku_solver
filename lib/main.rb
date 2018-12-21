$LOAD_PATH << './lib'
$LOAD_PATH << './lib/models'
require 'board'

state = [
  nil, 8, 5, 2, 9, nil, nil, 3, nil,
  2, 9, nil, nil, nil, 6, 4, nil, nil,
  nil, 1, 6, nil, 7, nil, nil, nil, nil,
  1, nil, 4, nil, 2, nil, nil, 6, 9,
  nil, nil, nil, 4, nil, 7, nil, nil, 3,
  5, nil, 8, 6, nil, nil, 7, 2, nil,
  7, nil, 3, nil, 6, 5, 8, nil, 1,
  nil, nil, nil, nil, 8, nil, nil, nil, nil,
  nil, nil, 1, 7, nil, nil, 3, nil, nil,
]

board = Board.new(state)

until board.solved?
  board.cells.reject(&:filled?).each do |cell|
    if cell.possible_values.length == 1
      cell.value = cell.possible_values[0]
    end
  end
end

board.rows.each { |row| puts row.inspect }

