const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Eu te amo\n');
});

server.listen(3000, '0.0.0.0', () => {
  console.log('Server running at http://127.0.0.1:3000/');
});
