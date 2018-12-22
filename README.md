# SUDOKU SOLVER

This was a quick attempt to see how far I could get with a sudoku solver in an afternoon.

Given a starting position (input in `lib/main.rb`, this program will:

1. Determine the possible values for each cell. If a cell has only one possible value, then it will set that cell to that value.
2. Determine the possible values for each block. If a block only has one cell for a possible value, then it will set that cell to that value.
2. Determine the possible values for each row. If a row only has one cell for a possible value, then it will set that cell to that value.
2. Determine the possible values for each column. If a column only has one cell for a possible value, then it will set that cell to that value.

This approach's mileage varies, depending on the starting position. Some puzzles require more complex analysis, which are not suitable to attempt for a one-day project.
