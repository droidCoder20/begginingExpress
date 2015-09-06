secret = 'zlotan'

module.exports =
  name: 'Packt'
  lower:(input) ->
    return input.toLowerCase()
  upper: (input) ->
    return input.toUpperCase()
  get_name: ->
    return @.name
  get_secret: ->
    return secret