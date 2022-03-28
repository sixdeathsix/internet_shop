const Router = require('express');
const router = new Router();
const historyController = require('../controllers/historyController')

router.get('/:userId', historyController.getOne)
router.get('/', historyController.getAll)

module.exports = router;