express = require 'express'
sg = require 'sgnodemapper'

server = express.createServer()

server.configure ->
  server.use express.bodyParser()

server.use (req, res) ->
  url = req.param('url')

  if url?
    res.send url: req.param('url'), sgn: sg.urlToGraphNode(url)
  else
    res.send 401, message: 'Please sepcify a url to lookup'

server.listen process.env.PORT || 3000, ->
  console.log "SGNMapper server listening on port #{server.address().port}"
