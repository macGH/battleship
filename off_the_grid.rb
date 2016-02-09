module OffTheGrid
  def off_the_grid(length, col, row, direction, maxcols, maxrows)
    if direction
      return (col + length - 1) > maxcols
    else
      return (row + length - 1) > maxrows
    end
  end
end
