require './recursiveMatrixRotate'

class Robot


  include RMR

  $directions = ['NORTH', 'EAST', 'SOUTH', 'WEST']

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
    place_robot
    create_table
    action
  end

  def place_robot
    @coords = []
    p 'Place the robot(x, y, f): '
    place = gets.chomp.split(',').each { |x| @coords.push(x)}
    @x = @coords[0].to_i - 1
    @y = @coords[1].to_i - 1
    @f = @coords[2].upcase
    @cursor = $directions.index(@f)
  end

  def create_table
    print "Set table size : \n"
    print 'M: '; @m = gets.chomp.to_i
    print 'N: '; @n = gets.chomp.to_i
    if @n > 0 && @m > 0
      p "#{@m}x#{@n} table created!"
      @table_map = Array.new(@m) { Array.new(@n, ' .')}
    else
      @m = 5; @n = 6
      @table_map = Array.new(@m) { Array.new(@n, ' .')}
    end
    render_table
    show_table
    report
  end

  def place_robot
    begin
      @coords = []
      print 'Place the robot(x, y, f): '
      place = gets.chomp.gsub(/\s+/, "").split(",").each { |x| @coords.push(x)}
      @x = @coords[0].to_i - 1
      @y = @coords[1].to_i - 1
      @f = @coords[2].upcase
      @cursor = $directions.index(@f)
    rescue
      p 'Input error! Input X, Y, F(NORTH EAST SOUTH WEST)'
      place_robot
    end
  end

  def action
    if @x > @n || @y > @m
      dummy
    else
      print "Action: "
      act = gets.chomp
      act.upcase!
      case act
      when "MOVE"
        move
      when 'LEFT'
        begin
          $directions = $directions.rotate(-1)
          @f = $directions[@cursor]
        rescue
          p 'Direction error! Input valid direction: NORTH EAST SOUTH WEST'
          place_robot
        end
        show_table
      when 'RIGHT'
        begin
          $directions.rotate!
          @f = $directions[@cursor]
        rescue
          p 'Direction error! Input valid direction: NORTH EAST SOUTH WEST'
          place_robot
        end
        show_table
      when 'REPORT'
        report
      when 'EXIT'
        return
      else
        action
      end
      action
    end
  end

  def move
    case @f
    when 'NORTH'
    @y + 1 >= @n ? action : @y += 1
    when 'EAST'
    @x + 1 >= @m ? action : @x += 1
    when 'WEST'
    @x - 1 < 0 ? action : @x -= 1
    when 'SOUTH'
    @y - 1 <= 0 ? action : @y -=1
    end
    render_table
    show_table
  end



  def render_table
    @table_map = Array.new(@m) { Array.new(@n, ' .')}
    @table_map[@x][@y] = ' R'
  end

  def show_table
    p "Robot watches #{@f}"
    rotated_show(@table_map, 3)
  end

  def report
    @table_map.length.times do |i|
      p "Robot coords: X: #{i + 1} Y: #{@table_map[i].index(' R') + 1}" if @table_map[i].include?(' R')
    end
    p "Robot watching #{@f}"
  end

  def dummy
    print 'Action(dummy): '
    dum = gets.chomp
    dum.upcase!
    case dum
    when 'EXIT'
      return
    else
      dummy
    end
  end

end

arnold = Robot.new
arnold.start
