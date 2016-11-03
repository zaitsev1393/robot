module RMR

  def rotate(matrix, t)
    if t == 0
      return matrix
    else
      final = []
      buffer = []
        matrix.length.times do |index|
        matrix.each { |elem| buffer.push(elem[index])}
        final.push(buffer.reverse)
        buffer = []
      end
      rotate(final, t - 1)
    end
  end

  def show(matrix)
    matrix.each do |x|
      x.each { |y| print " #{y}"}
      print "\n"
    end
  end

  def rotated_show(matrix, t)
    show(rotate(matrix, t))
  end

end
