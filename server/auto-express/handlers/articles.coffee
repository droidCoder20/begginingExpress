
namespace = require 'express-namespace'
exports.index = app (req,res) ->
    app.namespace '/articles', ->
        app.get '/', (req,res) ->
            res.send('index of articles')
        app.get '/new', (req,res) ->
            res.send('new of articles')
        app.get '/edit/:id', (req,res) ->
            res.send('edit with id' + req.params.id 'of articles')
        app.get '/delete/:id', (req,res) ->
            res.send('delete with id' + req.params.id 'of articles')
        app.get '/2013', (req,res) ->
            res.send('articles from 2013')
        ##Nested namedspaces
        app.namespace '/2013/jan', (req,res) ->
            app.get '/', (req,res) ->
                res.send('articles from jan 2013')
            app.get '/nodejs', (req,res) ->
                res.send('articles from jan 2013 about nodejs')
            app.get '/yolo', (req,res) ->
                res.send('YOLO SWAG')                            