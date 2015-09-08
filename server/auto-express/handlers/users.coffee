iniparser = require 'iniparser'
config    = iniparser.parseSync('./config.ini')

exports.index = (req,res) ->
    res.send('Index of users')

exports.new = (req,res) ->
    res.send('Form for new user')    

exports.create = (req,res) ->
    res.send('Handle form for new user') 

exports.show = (req,res) ->
    res.send("show user #{req.params.user}") 
    
exports.edit = (req,res) ->
    res.send("edit user #{req.params.user}") 
    
exports.update = (req,res) ->
    res.send("update user #{req.params.user}")                 
    
exports.destroy = (req,res) ->
    res.send("delete user #{req.params.user}")     