/*

    path: api/employee

*/

const { Router } = require('express');
const { check } = require('express-validator');

const { empleados, crearEmpleado, actualizarEmpleado } = require('../controllers/employee');
const { validarCampos } = require('../middlewares/validar-campos');

const router = Router();

router.post('/', empleados);

router.post('/new', [
    check('nombre', 'El nombre es obligatorio').not().isEmpty(),
    check('salario', 'El salario es obligatorio').not().isEmpty(),
    check('salario', 'El salario debe de ser un número').isNumeric(),
    validarCampos,
], crearEmpleado);

router.post('/update', actualizarEmpleado);


module.exports = router;