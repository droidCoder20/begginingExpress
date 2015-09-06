module.exports = (word) ->
  reversed = ''

  i = word.length - 1
  while (i> -1)
    letter = word[i]
    reversed += letter
    i--

  return reversed
