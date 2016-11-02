class Robot

  require './recursiveMatrixRotate'
  include RMR

  def start
    print 'Type "PLACE" first: '
    first_step = gets.chomp.upcase!
    if first_step == "PLACE"
      make_alive
    else
      start
    end
  end

  def make_alive
    create_table
    show_table
    place_robot
    report
  end

  def create_table
    print "Set table size : \n"
    print "M: "; @m = gets.chomp.to_i
    print "N: "; @n = gets.chomp.to_i
    if @n > 0 || @m > 0
      p "#{@m}x#{@n} table created!"
      @table_map = Array.new(@m, ' .') { Array.new(@n, ' .')}
    elsif @a = '' || @a = ''
      @table_map = Array.new(5, ' .') { Array.new(6, ' .')}
    end
  end

  def place_robot
    coords = []
    p "Place the robot(x,y,f): "

    place = gets.chomp.split(",").each { |x| coords.push(x.to_i - 1)}
    @f = coords[0][2]
    @table_map[coords[0]][coords[1]] = ' R'
  end

  def show_table
    final_show(@table_map, 3)
  end

  def report
    @table_map.length.times do |i|
      p "#{i} #{@table_map[i].index('R')}" if @table_map[i].index('R')
    end
  end

end

arnold = Robot.new
arnold.make_alive
