const ApiError = require("../error/apiError");
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const {User, Basket, Histories} = require('../models/models');

const generateJwt = (id, email, role) => {
  return jwt.sign(
      {id, email, role},
      process.env.JWT_KEY,
      {expiresIn: '24h'}
  )
}

class UserController {

  async registration(req, res, next) {
    const {name, email, password, role} = req.body

    if(!email || !password) {
      return next(ApiError.badRequest('Некорректный email или пароль'))
    }

    const candidate = await User.findOne({where: {email}})

    if(candidate) {
      return next(ApiError.badRequest('Пользователь уже зарегестрирован'))
    }

    const hashPassword = await bcrypt.hash(password, 5)

    const user = await User.create({name, email, role, password: hashPassword})

    const basket = Basket.create({userId: user.id})
    const history = Histories.create({userId: user.id})

    const jwtoken = generateJwt(user.id, user.email, user.role)

    return res.json({jwtoken})

  }

  async login(req, res, next) {
    const {email, password} = req.body
    const user = await User.findOne({where: {email}})
    if (!user) {
      return next(ApiError.internal('Пользователь не найден'))
    }

    let checkPassword = bcrypt.compareSync(password, user.password)
    if (!checkPassword) {
      return next(ApiError.internal('Неверный пароль'))
    }

    const jwtoken = generateJwt(user.id, user.email, user.role)

    return res.json({jwtoken})
  }
  
  async auth(req, res, next) {
    const jwtoken = generateJwt(req.user.id, req.user.email, req.user.role)
    return res.json({jwtoken})
  }

  async getInfo(req, res) {
    const {id} = req.params
    const user = await User.findOne(
      {
        where: {id},
        attributes: {exclude: ['password']}
      }
    )

    return res.json(user)
  }
}

module.exports = new UserController()