#!/usr/bin/env node
const prerender = require('prerender');

var server = prerender({
    chromeLocation: '/usr/bin/chromium-browser',
    chromeFlags: [
        "/usr/bin/chromium",
        "--no-sandbox",
        "--no-default-browser-check",
        "--no-first-run",
        "--disable-default-apps",
        "--disable-popup-blocking",
        "--disable-translate",
        "--disable-background-timer-throttling",
        "--headless",
        "--disable-gpu",
        "--remote-debugging-address=0.0.0.0",
        "--remote-debugging-port=9222",
        "--hide-scrollbars"
      ]
});
// server.use(prerender.sendPrerenderHeader());
// server.use(prerender.blockResources());
// server.use(prerender.removeScriptTags());
// server.use(prerender.httpHeaders());

server.start();
