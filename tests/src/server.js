const express = require('express')

const PORT   = process.env.PORT || 8080
const app = express()

console.log(`loool ${process.env.user}`)

app.get('/', (req,res) => res.send('<h1> its me!</h1>'))
app.get('/home', (req,res) => res.send('<h1> home page </h1>'))

app.listen(PORT, () => console.log(`port ${PORT} is opening`))