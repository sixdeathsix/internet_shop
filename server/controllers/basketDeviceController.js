const {BasketDevice} = require('../models/models')
const ApiError = require('../error/apiError')

class BasketDeviceController {
  async create(req, res, next) {
    try {
      let {basketId, deviceId} = req.body

      const contain = await BasketDevice.findOne({where: {deviceId}})

      if(contain) {
        return next(ApiError.badRequest('Товар уже в корзине'))
      }

      const basketDevice = await BasketDevice.create({basketId, deviceId});

      return res.json(basketDevice)
    } catch (e) {
      next(ApiError.badRequest(e.message))
    }
  }

  async getOne(req, res) {
    const {basketId} = req.params
    const basketDevice = await BasketDevice.findAll(
      {
        where: {basketId},
      }
    )

    return res.json(basketDevice)
  }

  async deleteOne(req, res) {

    let {basketId, deviceId} = req.body
    const basketDevice = await BasketDevice.destroy({where: {basketId: basketId, deviceId: deviceId}})

    return res.json(basketDevice)
  }
  
  async getAll(req, res) {
    const basketDevice = await BasketDevice.findAll()
    return res.json(basketDevice)
  }
}

module.exports = new BasketDeviceController();