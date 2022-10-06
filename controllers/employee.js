const { response } = require("express");
const bcrypt = require('bcryptjs');

const Empleado = require("../models/empleado");

const crearEmpleado = async (req, res = response) => {
    const { nombre } = req.body;
    console.log(nombre);

    try {
        if(await Empleado.findOne({nombre})) {
            return res.status(400).json({
                ok: false,
                msg: 'El empleado ya está registrado'
            });
        }

        const emplo = new Empleado(req.body);

        await emplo.save();

        res.json({
        ok: true,
        empleado: emplo,
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }
}

const actualizarEmpleado = async (req, res = response) => {
    const { uid, nombre, salario, deuda } = req.body;
    const update = {};

    if ( nombre != undefined ) update.nombre = nombre;
    if ( salario != undefined ) update.salario = salario;
    if ( deuda != undefined ) update.deuda = deuda;

    try {
        await Empleado.updateOne({ _id: uid }, update);

        res.json({
            ok: true,
            empleado: req.body,
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }

    
}

module.exports = {
    crearEmpleado,
    actualizarEmpleado
}