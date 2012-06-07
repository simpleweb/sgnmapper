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

## Copyright

Copyright Chris Mytton, Simpleweb 2012
