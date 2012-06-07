express = require 'express'
sg = require 'sgnodemapper'

server = express.createServer()

server.configure ->
  server.use express.bodyParser()

server.use (req, res) ->
  url = req.param('url')

  if url?
    sgUrl = sg.urlToGraphNode(url)
    res.send url: req.param('url'), sgn: sgUrl, sgnParsed: sg.parseSgnUrl(sgUrl)
  else if sgn = req.param('sgn')
    res.send url: sg.urlFromGraphNode(sgn, 'profile'), sgn: sgn, sgnParsed: sg.parseSgnUrl(sgn)
  else
    res.send 400, message: 'Please sepcify a url to lookup'

server.listen process.env.PORT || 3000, ->
  console.log "SGNMapper server listening on port #{server.address().port}"
