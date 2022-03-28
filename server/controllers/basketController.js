const {Basket} = require('../models/models')
const ApiError = require('../error/apiError')

class BasketController {
  async getOne(req, res) {
    const {userId} = req.params
    const basket = await Basket.findOne({where: {userId}})
    return res.json(basket)
  }
  async getAll(req, res) {
    const basket = await Basket.findAll()
    return res.json(basket)
  }
}

module.exports = new BasketController();