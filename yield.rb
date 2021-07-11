require './constants'

def jump_into(z, x, y)
  if z == Z
    TS.each {|t|
      print "#{ROOT_URL}/#{t}/#{z}/#{x}/#{y}.#{EXT}\n"
    }
  else
    2.times {|dx|
      2.times {|dy|
        jump_into(
          z + 1,
          2 * x + dx,
          2 * y + dy
        )
      }
    }
  end
end

jump_into(ZXY[0], ZXY[1], ZXY[2])

