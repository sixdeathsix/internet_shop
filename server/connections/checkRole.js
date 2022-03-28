const jwt = require('jsonwebtoken')

module.exports = function(role) {
  return function(req, res, next) {
    if(req.method === 'OPTIONS') {
      next()
    }
  
    try {
      const jwtoken = req.headers.authorization.split(' ')[1]
  
      if(!jwtoken) {
        res.status(401).json({message: "Пользователь не авторизован"})
      }
  
      const decoder = jwt.verify(jwtoken, process.env.JWT_KEY)

      if(decoder.role !== role) {
        return res.status(403).json({message: "В доступе отказано"})
      }
  
      req.user = decoder
      next()
      
    } catch (e) {
      res.status(401).json({message: "Пользователь не авторизован"})
    }
  }
}