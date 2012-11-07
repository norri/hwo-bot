Logger = require('./logger')
root = exports ? window

# Line 1 is point1 -> point2 and line 2 is point3 -> point4
# More information about intersecting lines http://paulbourke.net/geometry/lineline2d/
root.intersect = (point1, point2, point3, point4, direction) ->
  denom =  ((point4.y-point3.y) * (point2.x-point1.x)) - ((point4.x-point3.x) * (point2.y-point1.y))
  if denom isnt 0
    ua = (((point4.x-point3.x) * (point1.y-point3.y)) - ((point4.y-point3.y) * (point1.x-point3.x))) / denom
    if ((ua >= 0) and (ua <= 1))
      ub = (((point2.x-point1.x) * (point1.y-point3.y)) - ((point2.y-point1.y) * (point1.x-point3.x))) / denom
      if ((ub >= 0) and (ub <= 1))
        x = point1.x + (ua * (point2.x-point1.x))
        y = point1.y + (ua * (point2.y-point1.y))
        Logger.log "Helper", "intersect success: #{x}, #{y}"
        {x: x, y: y, collision: direction}

root.intersectWall = (point1, point2, wallCoordinates, direction) ->
  root.intersect point1, point2, wallCoordinates[0], wallCoordinates[1], direction

root.clone = (obj) ->
  if not obj? or typeof obj isnt 'object'
    return obj

  if obj instanceof Date
    return new Date(obj.getTime()) 

  if obj instanceof RegExp
    flags = ''
    flags += 'g' if obj.global?
    flags += 'i' if obj.ignoreCase?
    flags += 'm' if obj.multiline?
    flags += 'y' if obj.sticky?
    return new RegExp(obj.source, flags) 

  newInstance = new obj.constructor()

  for key of obj
    newInstance[key] = root.clone obj[key]

  return newInstance

