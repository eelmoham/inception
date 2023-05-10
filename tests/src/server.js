const express = require('express')

const PORT   = 8080
const app = express()

app.get('/', (req,res) => res.send('<h1> looool1!</h1>'))
app.get('/home', (req,res) => res.send('<h1> home page </h1>'))

app.listen(PORT, () => console.log(`port ${PORT} is opening`))