/*

    path: api/login

*/

const { Router } = require('express');
const { check } = require('express-validator');

const { crearUsuario, actualizarUsuario, login, renewToken } = require('../controllers/auth');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar.jwt');

const router = Router();

router.post('/new', [
    check('nombre', 'El nombre es obligatorio').not().isEmpty(),
    check('usuario', 'El usuario es obligatorio').not().isEmpty(),
    check('password', 'La contraseña es obligatoria').not().isEmpty(),
    validarCampos,
], crearUsuario);

router.post('/update', actualizarUsuario);

router.post('/', [
    check('usuario', 'El usuario es obligatorio').not().isEmpty(),
    check('password', 'La contraseña es obligatoria').not().isEmpty(),
    validarCampos,
], login);

router.get('/renew', validarJWT, renewToken);

module.exports = router;