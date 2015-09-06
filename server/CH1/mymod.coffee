name = exports.name = 'Packt'
secret = 'zlotan'

exports.lower (input) ->
  return input.toLowerCase()

exports.upper (input) ->
  return input.toUpperCase()

exports.get_name ->
  return name

exports.get_secret ->
  return secret

