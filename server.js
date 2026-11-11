const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {
        'Content-Type': 'text/html; charset=utf-8'
    });

    res.end(`
        <h1>DataVision</h1>
        <p>Aplicación desplegada automáticamente con AWS CodeDeploy.</p>
    `);
});

server.listen(3000, '0.0.0.0', () => {
    console.log('Servidor ejecutándose en el puerto 3000');
});
