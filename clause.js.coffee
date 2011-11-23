class Clause

  constructor: (@order_by) ->

  invert: -> column.invert() for column in @order_by ; this

  valueOf: -> @toString()

  toString: -> ("#{column}" for column in @order_by).join(', ')
