const {io} = require('../index');

// Mensajes de sockets
io.on('connection', client => {

    // Al conectarse
    console.log('Cliente conectado');

    // Al desconectarse
    client.on('disconnect', () => { 
        console.log('Cliente desconectado');
    });
});
