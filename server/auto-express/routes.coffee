appRoute   = require './handlers'
usersRoute = require './handlers/users'

module.exports = (app) ->
    ## Routes
    app.get '/', appRoute.index
    app.get '/users', usersRoute.list

