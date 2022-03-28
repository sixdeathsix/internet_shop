const Router = require('express');
const router = new Router();
const basketDeviceController = require('../controllers/basketDeviceController')

router.post('/', basketDeviceController.create)
router.get('/:basketId', basketDeviceController.getOne)
router.delete('/', basketDeviceController.deleteOne)
router.get('/', basketDeviceController.getAll)

module.exports = router;