const Router = require('express');
const router = new Router();
const deviceController = require('../controllers/deviceController')
const  checkRole = require('../connections/checkRole')

router.post('/', checkRole('ADMIN'), deviceController.create)
router.get('/', deviceController.getAll)
router.get('/all', deviceController.getSearchAll)
router.get('/:id', deviceController.getOne)
router.delete('/', checkRole('ADMIN'), deviceController.deleteOne)

module.exports = router;