const {Type} = require('../models/models');
const ApiError = require('../error/apiError')

class TypeController {
  async create(req, res) {
    const {name} = req.body
    const type = await Type.create({name})
    return res.json(type)
  }

  async getAll(req, res) {
    const types = await Type.findAll()
    return res.json(types)
  }

  async deleteOne(req, res) {

    let {id} = req.body
    const device = await Type.destroy({where: {id: id}})

    return res.json(device)
  }
}

module.exports = new TypeController();