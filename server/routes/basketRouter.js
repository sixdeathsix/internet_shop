const Router = require('express');
const router = new Router();
const basketController = require('../controllers/basketController')

router.get('/:userId', basketController.getOne)
router.get('/', basketController.getAll)

module.exports = router;