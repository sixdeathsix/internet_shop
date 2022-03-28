const jwt = require('jsonwebtoken')

module.exports = function(req, res, next) {
  if(req.method === 'OPTIONS') {
    next()
  }

  try {
    const jwtoken = req.headers.authorization.split(' ')[1]

    if(!jwtoken) {
      return res.status(401).json({message: "Пользователь не авторизован"})
    }

    const decoder = jwt.verify(jwtoken, process.env.JWT_KEY)

    req.user = decoder
    next()
    
  } catch (e) {
    res.status(401).json({message: "Пользователь не авторизован"})
  }
}