const { response } = require("express");
const bcrypt = require('bcryptjs');

const Usuario = require("../models/usuario");
const { generarJWT } = require("../helpers/jwt");

const crearUsuario = async (req, res = response) => {
    const { usuario, password } = req.body;

    try {
        const existeUsuario = await Usuario.findOne({usuario});
        if(existeUsuario) {
            return res.status(400).json({
                ok: false,
                msg: 'El usuario ya está registrado'
            });
        }

        const user = new Usuario(req.body);

        // Encriptar contraseña
        const salt = bcrypt.genSaltSync();
        user.password = bcrypt.hashSync(password, salt);

        await user.save();

        // Generar JWT
        const token = await generarJWT(user.id);

        res.json({
        ok: true,
        usuario: user,
        token
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }
}

const actualizarUsuario = async (req, res = response) => {
    const { uid, nombre, usuario, password } = req.body;
    const update = {};

    if ( nombre != undefined ) update.nombre = nombre;
    if ( usuario != undefined ) update.usuario = usuario;
    if ( password != undefined ) {
        const salt = bcrypt.genSaltSync();
        update.password = bcrypt.hashSync(password, salt);
    }

    try {
        usr = await Usuario.updateOne({ uid }, update);

        res.json({
        ok: true,
        usuario: req.body,
        });

    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Habla con el administrador'
        });
    }

    
}

const login = async (req, res = response) => {
    const { usuario, password } = req.body;

    try {
        const usuarioDB = await Usuario.findOne({usuario});

        if (!usuarioDB) {
            return res.status(404).json({
                ok: false,
                msg: 'Usuario no encontrado'
            });
        }

        // Validar password
        const validPassword = bcrypt.compareSync(password, usuarioDB.password);
        if (!validPassword) {
            return res.status(400).json({
                ok: false,
                msg: 'Contraseña incorrecta'
            });
        }

        // Generar JWT
        const token = await generarJWT(usuarioDB.id);

        res.json({
            ok: true,
            usuario: usuarioDB,
            token
        });
        
    } catch (error) {
        console.log(error);
        return res.status(500).json({
            ok: false,
            msg: 'Hable con el administrador'
        })
    }
}

const renewToken = async (req, res = response) => {
    const uid = req.uid;
    const token = await generarJWT(uid);

    const usuario = await Usuario.findOne({ uid: uid });

    res.json({
        ok: true,
        usuario: usuario,
        token
    })
}

module.exports = {
    crearUsuario,
    actualizarUsuario,
    login,
    renewToken
}