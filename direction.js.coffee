class Direction
  @ASC: 0b01
  @DESC: 0b10

  @numValueOf: (direction) ->
    return direction & 0b11 if typeof direction is 'number'
    switch direction.toString().toUpperCase()
      when '', 'ASC' then Direction.ASC
      when 'DESC' then Direction.DESC
      else 0

  @strValueOf: (direction) ->
    switch +direction
      when Direction.DESC then 'DESC'
      when Direction.ASC then 'ASC'
      else ''

  constructor: (direction = Direction.ASC) -> @setDirection direction

  set: (direction) -> @direction = Direction.numValueOf(direction) ; this

  invert: -> @direction ^= 0b11 ; this

  valueOf: -> @toString()

  toString: -> Direction.strValueOf @direction

  setDirection: (direction) -> @direction = Direction.numValueOf(direction) ; this

