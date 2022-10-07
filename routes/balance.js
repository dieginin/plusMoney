/*

    path: api/balance

*/

const { Router } = require('express');
const { check } = require('express-validator');

const { movimientos, nuevoMovimiento, editarMovimiento, borrarMovimiento } = require('../controllers/balance');
const { validarCampos } = require('../middlewares/validar-campos');

const router = Router();

router.get('/', movimientos);

router.post('/new', [
    check('fecha', 'La fecha es obligatoria').not().isEmpty(),
    check('concepto', 'El concepto es obligatorio').not().isEmpty(),
    check('tipo', 'El tipo de movimiento es obligatorio').not().isEmpty(),
    check('monto', 'El monto es obligatorio').not().isEmpty(),
    check('eid', 'El eid debe de ser un número').isNumeric(),
    validarCampos,
], nuevoMovimiento);

router.post('/update', editarMovimiento);

router.post('/delete', borrarMovimiento);

module.exports = router;