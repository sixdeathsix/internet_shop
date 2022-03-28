const {HistoryDevice, BasketDevice} = require('../models/models')
const ApiError = require('../error/apiError')

class HistoryDeviceController {
  async create(req, res, next) {
    try {
      let {historyId, deviceId} = req.body

      const historyDevice = await HistoryDevice.create({historyId, deviceId});

      return res.json(historyDevice)
    } catch (e) {
      next(ApiError.badRequest(e.message))
    }
  }
  
  async createArray(req, res, next) {
    try {
      let {historyId, array} = req.body
      
      const dd = array.map(
      
        async d => {
          await HistoryDevice.create({historyId, deviceId: d.id})
        }
      )

      return res.json(dd)
    } catch (e) {
      next(ApiError.badRequest(e.message))
    }
  }

  async getOne(req, res) {
    const {historyId} = req.params
    const historyDevice = await HistoryDevice.findAll(
      {
        where: {historyId},
      }
    )

    return res.json(historyDevice)
  }

  async deleteOne(req, res) {

    let {historyId, deviceId} = req.body
    const historyDevice = await HistoryDevice.destroy({where: {historyId: historyId, deviceId: deviceId}})

    return res.json(historyDevice)
  }
  
  async getAll(req, res) {
    const historyDevice = await HistoryDevice.findAll()
    return res.json(historyDevice)
  }
}

module.exports = new HistoryDeviceController();