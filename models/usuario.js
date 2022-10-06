const {Schema, model} = require('mongoose');

const UsuarioSchema = Schema({
    _id: {
        type: Object,
        required: false
    },
    nombre: {
        type: String,
        required: false
    },
    usuario: {
        type: String,
        required: false,
        unique: true,
    },
    password: {
        type: String,
        required: false
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