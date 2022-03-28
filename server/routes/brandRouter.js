const Router = require('express');
const router = new Router();
const brandController = require('../controllers/brandController')
const  checkRole = require('../connections/checkRole')

router.post('/', checkRole('ADMIN'), brandController.create)
router.get('/', brandController.getAll)
router.delete('/', checkRole('ADMIN'), brandController.deleteOne)

module.exports = router;