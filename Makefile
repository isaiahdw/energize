JSCS = node_modules/.bin/jscs
JSHINT = node_modules/.bin/jshint
BABEL = node_modules/.bin/babel
WEBPACK = node_modules/webpack/bin/webpack.js
DEVSERVER = node_modules/webpack-dev-server/bin/webpack-dev-server.js

export NODE_ENV = test

.PHONY: build clean dev dist lint

build:
	$(WEBPACK) --optimize-minimize --optimize-occurence-order --devtool source-map --verbose --display-chunks --bail

clean:
	rm -r dist || true

dist: clean
	$(BABEL) src/ --modules common --out-dir dist

dev:
	NODE_ENV=development $(DEVSERVER) --content-base dist/ --hot --devtool eval-source-map --progress --colors --debug --output-pathinfo

lint:
	$(JSHINT) .
	$(JSCS) -c .jscsrc .

