const Router = require('express');
const router = new Router();
const deviceRouter = require('./deviceRouter')
const userRouter = require('./userRouter')
const brandRouter = require('./brandRouter')
const typeRouter = require('./typeRouter')
const basketRouter = require('./basketRouter')
const basketDevicesRouter = require('./basketDevicesRouter')
const historyRouter = require('./historyRouter')
const historyDevicesRouter = require('./historyDevicesRouter')

router.use('/user', userRouter);
router.use('/type', typeRouter);
router.use('/brand', brandRouter);
router.use('/device', deviceRouter);
router.use('/basket', basketRouter);
router.use('/basketDevice', basketDevicesRouter);
router.use('/history', historyRouter);
router.use('/historyDevice', historyDevicesRouter);

module.exports = router;