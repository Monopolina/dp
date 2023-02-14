const fastify = require("fastify")({ logger: true });
const mysql = require("mysql2");
const pool = mysql.createPool({
  connectionLimit: 5,
  host: "localhost",
  user: "pol",
  database: "dp",
  password: "1234",
  dateStrings: true
});
global.pool = pool;

fastify.register(require('@fastify/cors'), {
  origin: true
})

fastify.register(require('@fastify/jwt'), { secret: 'supersecret' })
fastify.register(require('@fastify/auth'))

fastify.decorate('verifyJWTandLevel', verifyJWTandLevel)
fastify.decorate('verifyUserAndPassword', verifyUserAndPassword)

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

fastify.route({
  method: 'POST',
  url: '/register',
  schema: {
    body: {
      type: 'object',
      properties: {
        user: { type: 'string' },
        password: { type: 'string' }
      },
      required: ['user', 'password']
    }
  },
  handler: (req, reply) => {
    req.log.info('Creating new user')
    const params = [req.body.user, req.body.password, req.body.email]
    pool.query("INSERT INTO users (user, password, email) VALUES (?,?,?)", params, function (err, data) {
      if (err) reply.send(err);
      onPut()
    });

    function onPut(err) {
      if (err) return reply.send(err)
      pool.query("SELECT admin FROM users WHERE user=?", [req.body.user], (err, result) => {
        fastify.jwt.sign({ user: req.body.user, admin: result[0].admin }, onToken)
      })
    }

    function onToken(err, token) {
      if (err) return reply.send(err)
      req.log.info('User created')
      reply.send({ token })
    }
  }
})

fastify.route({
  method: 'POST',
  url: '/login',
  handler: fastify.verifyUserAndPassword
})

function verifyJWTandLevel(request, reply, done) {
  if (!request.headers.authorization.replace("Bearer ", "")) {
    return new Error('Missing token header')
  }
  const decoded = fastify.jwt.verify(request.headers.authorization.replace("Bearer ", ""))
  console.log(decoded)
  pool.query("SELECT * FROM users WHERE user=?", [decoded.user], (err, result, fields) => {
    if (err) reply.status(401).send(err)
    console.log(result)
    if (request.body.password == result[0].password) {
      console.log(true)
      done()
    }
    reply.status(401).send("ошибка")
  })
}

function verifyUserAndPassword(request, reply, done) {
  pool.query("SELECT * FROM users WHERE user=?", [request.body.user], (err, result, fields) => {
    console.log(result[0])
    if (err) reply.status(401).send(err)
    if (result.length)
      onUser(err, result[0].password)
  })

  function onUser(err, password) {
    if (err) {
      if (err.notFound) {
        return reply.send(new Error('Password not valid'))
      }
      return reply.send(err)
    }

    if (!password || password !== request.body.password) {
      return reply.send(new Error('Password not valid'))
    }
    pool.query("SELECT admin FROM users WHERE user=?", [request.body.user], (err, result) => {
      fastify.jwt.sign({ user: request.body.user, admin: result[0].admin }, (err, result) => { reply.send(result) })
    })
  }
}

fastify.route({
  method: 'GET',
  url: '/product', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT * FROM product", (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result) }
    })
  },
})

fastify.route({
  method: 'GET',
  url: '/magazin',
  handler: (req, res) => {
    pool.query("SELECT * FROM product", (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result) }
    })
  },
})

fastify.route({
  method: 'GET',
  url: '/tovar/:id',
  handler: (req, res) => {
    pool.query("SELECT * FROM product WHERE id=?", [req.params.id], (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result[0]) }
    })
  },
})

fastify.route({
  method: 'POST',
  url: '/product/create', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT id FROM categori WHERE categoria LIKE ?", [req.body.categori_name], (err, result1) => {
      if (err) { res.send(err) }
      else {
        pool.query("SELECT id FROM provider WHERE name_provider LIKE ?", [req.body.provider_name], (err, result2) => {
          if (err) { res.send(err) }
          else {
            const params = [req.body.product_name, result1[0].id, req.body.price, req.body.img, req.body.available_in_stock, req.body.delivery, req.body.description, req.body.characteristic, result2[0].id];
            pool.query("INSERT INTO product (product_name, id_categori, price, img, available_in_stock, delivery, description, characteristic, id_provider) VALUES (?,?,?,?,?,?,?,?,?)", params, (err, result) => {
              if (err) { res.send(err) }
              else { res.send(result) }
            })
          }
        })
      }
    })
  }
})

fastify.route({
  method: 'GET',
  url: '/product/selectprovider', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT * FROM provider", (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result) }
    })
  },
})
fastify.route({
  method: 'GET',
  url: '/product/selectcategori', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT * FROM categori", (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result) }
    })
  },
})

fastify.route({
  method: 'GET',
  url: '/product/delete/:id', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("DELETE FROM product WHERE id=?", [req.params.id], (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result) }
    })
  },
})

fastify.route({
  method: 'GET',
  url: '/product/:id', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT * FROM product WHERE id=?", [req.params.id], (err, result) => {
      if (err) { res.send(err) }
      else { res.send(result[0]) }
    })
  },
})

fastify.route({
  method: 'POST',
  url: '/product/edit', preHandler: AdminGuard,
  handler: (req, res) => {
    pool.query("SELECT id FROM categori WHERE categoria LIKE ?", [req.body.categori_name], (err, result1) => {
      if (err) { res.send(err) }
      else {
        pool.query("SELECT id FROM provider WHERE name_provider LIKE ?", [req.body.provider_name], (err, result2) => {
          if (err) { res.send(err) }
          else {
            const params = [req.body.product_name, result1[0].id, req.body.price, req.body.img, req.body.available_in_stock, req.body.delivery, req.body.description, req.body.characteristic, result2[0].id];
            pool.query("UPDATE product SET (product_name, id_categori, price, img, available_in_stock, delivery, description, characteristic, id_provider) VALUES (?,?,?,?,?,?,?,?,?)", params, (err, result) => {
              if (err) { res.send(err) }
              else { res.send(result) }
            })
          }
        })
      }
    })
  }
})

fastify.listen({ port: 3000, host: '0.0.0.0' }, err => {
  if (err) throw err
})