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

fastify.get("/product", async (req, res) => {
pool.query("SELECT * FROM product", (err, result)=>{
if(err) res.send(err) 
else res.send(result)
console.log(result)
})})

fastify.get('/', (req, reply) => {
})
 fastify.listen({ port: 3001 })