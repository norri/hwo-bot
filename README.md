# Pingpong CoffeeScript client

This project contains a coffeescript client for the [Reaktor Hello World Open event](http://helloworldopen.fi/).

NOTICE: The test server enforces a threshold of 10 messages per client in a second. At the moment the bot answers each message from the server with up direction message. This exceeds the threshold defined by the server and kicks the bot out of the game.

## Requires

Existing [node.js](http://nodejs.org)/[npm](https://npmjs.org/) installation.
Tested with npm v1.0.106 @ OS X and with v1.1.9 @ Linux

## Installation

Run `build.sh`. Installs coffeescript and node-binary locally (doesn't use sudo)

## Run the bot

Start the pingpong game bot with `start.sh <playername> <serverhostname> <serverport>`.

Stop the bot with `stop.sh`.

## Reference documentation

* http://es5.github.com
* http://coffeescript.org
* http://coffeescriptcookbook.com
* http://nodejs.org
* https://github.com/substack/node-binary

## Credits

Copyright (C) 2012 Aki Kaivola, Heikki Pora, Lauri Lehmijoki, Toni Strandell.

Distributed under the Apache-2.0 license http://www.apache.org/licenses/LICENSE-2.0.html