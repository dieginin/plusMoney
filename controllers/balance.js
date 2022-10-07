const { response } = require("express");

const Movimiento = require("../models/movimiento");

const movimientos = async (req, res = response) => {
    const { eid } = req.body;

    try {
        mov = await Movimiento.find({eid});

        res.json({
        ok: true,
        movimientos: mov,
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }
}

const nuevoMovimiento = async (req, res = response) => {
    try {
        const mov = new Movimiento(req.body);

        await mov.save();

        res.json({
            ok: true,
            movimiento: mov,
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }
}

const editarMovimiento = async (req, res = response) => {
    const { uid, concepto, tipo, monto, nota } = req.body;
    const update = {};

    if ( concepto != undefined ) update.concepto = concepto;
    if ( tipo != undefined ) update.tipo = tipo;
    if ( monto != undefined ) update.monto = monto;
    if ( nota != undefined ) update.nota = nota;

    try {
        if (await Movimiento.updateOne({ _id: uid }, update)) {
            return res.json({
                ok: true,
                movimiento: req.body,
            });
        }

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }
}

const borrarMovimiento = async (req, res = response) => {
    const { uid } = req.body;

    try {
        await Movimiento.findOneAndRemove({_id: uid});

        res.json({
        ok: true,
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
    movimientos,
    nuevoMovimiento,
    editarMovimiento,
    borrarMovimiento
}