const {Schema, model} = require('mongoose');

const UsuarioSchema = Schema({
    nombre: {
        type: String,
        required: true
    },
    usuario: {
        type: String,
        required: true,
        unique: true,
    },
    password: {
        type: String,
        required: true
    },
    eid: {
        type: String,
        required: false
    },
});

UsuarioSchema.method('toJSON', function() {
    const { __v,_id, password, ...object } = this.toObject();
    object.uid = _id;
    return object;
});

module.exports = model('Usuario', UsuarioSchema);