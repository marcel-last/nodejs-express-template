'use strict';

const express = require('express');

// Constants
const APP_NAME = 'nodejs-express-template'
const APP_VERSION = '0.0.1'
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`${APP_NAME} ${APP_VERSION} is running on http://${HOST}:${PORT}`);
