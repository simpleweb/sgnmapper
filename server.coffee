express = require 'express'
sg = require 'sgnodemapper'

server = express.createServer()

server.configure ->
  server.use express.bodyParser()
  server.use (req, res, next) ->
    res.header 'Link', '<https://github.com/simpleweb/sgnmapper>; rel="help"; title="GitHub project"'
    next()

server.use (req, res) ->
  url = req.param('url')

  if url?
    sgUrl = sg.urlToGraphNode(url)
    res.send url: req.param('url'), sgn: sgUrl, sgnParsed: sg.parseSgnUrl(sgUrl)
  else if sgn = req.param('sgn')
    res.send url: sg.urlFromGraphNode(sgn, 'profile'), sgn: sgn, sgnParsed: sg.parseSgnUrl(sgn)
  else
    res.send error: 'Try POSTing a url field to /', 400

server.listen process.env.PORT || 3000, ->
  console.log "SGNMapper server listening on port #{server.address().port}"
