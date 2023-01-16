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

fastify.get("/product",  (req, res) => {
pool.query("SELECT * FROM product",  (err, result)=>{
if(err) { res.send(err)} 
else { res.send(result)}
})})

fastify.route({
  method: 'GET',
  url: '/product',
  handler: ()=>{
    pool.query("SELECT * FROM product",  (err, result)=>{
      if(err) { res.send(err)} 
      else { res.send(result)}})
  },
  
})

fastify.get('/', (req, reply) => {
})
 fastify.listen({ port: 3001 })