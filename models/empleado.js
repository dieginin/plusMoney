const {Schema, model} = require('mongoose');

const EmpleadoSchema = Schema({
    nombre: {
        type: String,
        required: false,
    },
    salario: {
        type: Number,
        required: false,
    },
    deuda: {
        type: Number,
        required: false
    },
    eid: {
        type: String,
        required: false
    },
});

EmpleadoSchema.method('toJSON', function() {
    const { __v,_id, ...object } = this.toObject();
    object.uid = _id;
    return object;
});

module.exports = model('Empleado', EmpleadoSchema);