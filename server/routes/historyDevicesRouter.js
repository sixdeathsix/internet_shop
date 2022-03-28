const Router = require('express');
const router = new Router();
const historyDeviceController = require('../controllers/historyDeviceController')

router.post('/', historyDeviceController.create)
router.post('/array', historyDeviceController.createArray)
router.get('/:historyId', historyDeviceController.getOne)
router.delete('/', historyDeviceController.deleteOne)
router.get('/', historyDeviceController.getAll)

module.exports = router;