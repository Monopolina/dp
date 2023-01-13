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
      pool.query("INSERT INTO users (user, password, email) VALUES (?,?,?)", params, function(err, data){
        if(err) reply.send(err);
        onPut()
    });

      function onPut (err) {
        if (err) return reply.send(err)
        pool.query("SELECT admin FROM users WHERE user=?",[req.body.user], (err, result)=>{
          fastify.jwt.sign({ user: req.body.user, admin: result[0].admin }, onToken)
        })
      }

      function onToken (err, token) {
        if (err) return reply.send(err)
        req.log.info('User created')
        reply.send({ token })
      }
    }
  })
  
  fastify.route({
      method: 'POST',
      url: '/login',
      handler:fastify.verifyUserAndPassword
    })

function verifyJWTandLevel (request, reply, done) {
    if (!request.headers.authorization.replace("Bearer ", "")) {
      return new Error('Missing token header')
    }
      const decoded = fastify.jwt.verify(request.headers.authorization.replace("Bearer ", "")) 
      console.log(decoded)
       pool.query("SELECT * FROM users WHERE user=?", [decoded.user],(err, result,fields)=>{
        if (err) reply.status(401).send(err)
        console.log(result)
        if(request.body.password == result[0].password){
          console.log(true)
          done()
        }
        reply.status(401).send("ошибка")
       })
  }
  
  function verifyUserAndPassword (request, reply, done) {
    pool.query("SELECT * FROM users WHERE user=?",[request.body.user],(err,result,fields)=>{
      console.log(result[0])
      if (err) reply.status(401).send(err)
      if (result.length)
      onUser(err,result[0].password)
    })

    function onUser (err, password) {
      if (err) {
        if (err.notFound) {
          return reply.send(new Error('Password not valid'))
        }
        return reply.send(err)
      }

      if (!password || password !== request.body.password) {
        return reply.send(new Error('Password not valid'))
      }
      pool.query("SELECT admin FROM users WHERE user=?",[request.body.user], (err, result)=>{
          fastify.jwt.sign({ user: request.body.user, admin: result[0].admin }, (err,result)=>{reply.send(result)})
        })
    }
  }

  fastify.listen({ port: 3000, host: '0.0.0.0' }, err => {
    if (err) throw err
  })