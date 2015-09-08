appRoute   = require './handlers',
usersRoute = require './handlers/users',
#articlesRoute = require './handlers/articles'

module.exports = (app) ->
    ## Routes
    app.get '/', appRoute.index
    #app.get '/users', usersRoute.list
    #app.get '/articles', articlesRoute.index(app) 

