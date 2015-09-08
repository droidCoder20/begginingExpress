iniparser = require 'iniparser'
config    = iniparser.parseSync('./config.ini')

exports.index = (req,res) ->
    ## Injecting headers
    res.status(200);
    res.set({
        'Content-Type': 'text/html; charset=us-ascii'
        'X-Secret-Message': 'not really secret'
        'X-Test': 'OK'
    })
    res.render('index', {title: config.title, message: config.message}) 
