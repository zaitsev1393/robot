array = [
  [1, 2, 3],
  [4, 'R', 6],
  [7, 8, 9]
]

array.length.times do |i|
  p "#{i} #{array[i].index('R')}" if array[i].index('R')
end
