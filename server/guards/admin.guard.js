const { fastify } = require("../index.js")
const AdminGuard = (req, res, done) => {
  try {
    const token = req.headers.authorization.replace("Bearer ", "")
    fastify.jwt.verify(token, (err, decoded) => {
      if (err) {
        res.code(403).send(err)
      }
      done()
    })
  } catch (error) {
    res.code(403).send(error)
  }
}
exports.AdminGuard = AdminGuard