const {Brand} = require('../models/models')
const ApiError = require('../error/apiError')

class BrandController {
  async create(req, res) {
    const {name} = req.body
    const brand = await Brand.create({name})
    return res.json(brand)
  }

  async getAll(req, res) {
    const brands = await Brand.findAll()
    return res.json(brands)
  }

  async deleteOne(req, res) {

    let {id} = req.body
    const device = await Brand.destroy({where: {id: id}})

    return res.json(device)
  }
}

module.exports = new BrandController();