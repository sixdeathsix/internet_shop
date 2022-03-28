const {History} = require('../models/models')
const ApiError = require('../error/apiError')

class HistoryController {
  async getOne(req, res) {
    const {userId} = req.params
    const history = await History.findOne({where: {userId}})
    return res.json(history)
  }
  async getAll(req, res) {
    const history = await History.findAll()
    return res.json(history)
  }
}

module.exports = new HistoryController();