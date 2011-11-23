class Column

  constructor: (@column_name = '', @direction = new Direction(), @table_name = null) ->

  setDirection: (direction) -> @direction.set(direction) ; this

  invert: -> @direction.invert() ; this

  valueOf: -> @toString()

  toString: ->
    if @table_name?
      "#{@table_name}.#{@column_name} #{@direction}"
    else
      "#{@column_name} #{@direction}"

