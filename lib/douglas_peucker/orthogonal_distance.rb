module DouglasPeucker
  # From http://mathworld.wolfram.com/Point-LineDistance2-Dimensional.html
  class OrthogonalDistance < Struct.new(:point, :line)
    def distance
      # Marcus' correction to handle loops
      if line.end.x == line.start.x && line.end.y == line.start.y
        ((line.start.x - point.x)**2+(line.start.y - point.y)**2)**0.5
      else
        numerator.abs/denominator**0.5
      end
    end

    private

    def numerator
      ((line.end.x - line.start.x)*(line.start.y - point.y) - (line.start.x - point.x)*(line.end.y - line.start.y))
    end

    def denominator
      (line.end.x - line.start.x)**2 + (line.end.y - line.start.y)**2
    end
  end
end
