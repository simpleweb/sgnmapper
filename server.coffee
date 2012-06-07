express = require 'express'
sg = require 'sgnodemapper'

server = express.createServer()

server.use (req, res) ->
  url = req.param('url')
  res.send url: req.param('url'), sgn: sg.urlToGraphNode(url)

server.listen process.env.PORT || 3000
