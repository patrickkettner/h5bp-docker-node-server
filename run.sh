#!/usr/bin/env node

// You can modify this file and rebuild the docker container

var h5bp = require('h5bp');

var app = h5bp.createServer({ root: '/var/www' });
app.listen(80);
