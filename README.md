# sgnodemapper as a service

This project provides an [sgnodemapper]() over http, allowing easy
conversion from `http` to `sgn` and back again.

## Install

Clone this repository from GitHub, then install the dependencies using
`npm(1)`.

```
git clone https://github.com/simpleweb/sgnmapper.git
cd sgnmapper
npm install
```

## Usage

### Server

To start the server on port 3000 you can run:

```
./node_modules/.bin/coffee server.coffee
```

Alternativly you can use [foreman](https://github.com/ddollar/foreman)
to manage running the application processes, this will start them on
port 5000.

```
foreman start
```

### Client

To convert an http url to an sgn url, provide the url as a parameter,
with `curl(1)` it would look something like:

```
$ curl -s http://localhost:3000/ -d 'url=http://twitter.com/hecticjeff'
{"url":"http://twitter.com/hecticjeff","sgn":"sgn://twitter.com/?ident=hecticjeff","sgnParsed":{"domain":"twitter.com","keyName":"ident","value":"hecticjeff"}}
```

To convert from sgn url back to http, provide an `sgn` parameter:

```
$ curl -s http://localhost:3000/ -d 'sgn=sgn://twitter.com/?ident=hecticjeff'
{"url":"http://twitter.com/hecticjeff","sgn":"sgn://twitter.com/?ident=hecticjeff","sgnParsed":{"domain":"twitter.com","keyName":"ident","value":"hecticjeff"}}
```

## Copyright

Copyright Chris Mytton, Simpleweb 2012
