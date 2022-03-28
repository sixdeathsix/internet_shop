const Router = require('express');
const router = new Router();
const userController = require('../controllers/userController')
const authMiddleware = require('../connections/auth')

router.post('/registration', userController.registration)
router.post('/login', userController.login)
router.get('/auth', authMiddleware, userController.auth)
router.get('/user/:id', authMiddleware, userController.getInfo)

module.exports = router;