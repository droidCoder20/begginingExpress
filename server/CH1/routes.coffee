module.exports = (app) ->
  app.get '/', (req,res) ->
    res.send('Welcome!')

  app.get '/hello.txt', (req,res) ->
    res.send('Hola!')

  app.get '/contact', (req,res) ->
    res.render('contact')