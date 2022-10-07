const {Schema, model} = require('mongoose');

const MovimientoSchema = Schema({
    fecha: {
        type: String,
        required: false
    },
    concepto: {
        type: String,
        required: false
    },
    tipo: {
        type: String,
        required: false
    },
    monto: {
        type: String,
        required: false
    },
    nota: {
        type: String,
        required: false
    },
    eid: {
        type: String,
        required: false
    },
});

MovimientoSchema.method('toJSON', function() {
    const { __v,_id, ...object } = this.toObject();
    object.uid = _id;
    return object;
});

module.exports = model('Movimiento', MovimientoSchema);