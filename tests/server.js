const express = require('express')

const PORT   = 8080
const app = express()

app.get('/', (req,res) => res.send('<h1> looool !</h1>'))
app.get('/home', (req,res) => res.send('<h1> Home</h1>'))

app.listen(PORT, () => console.log(`port ${PORT} is opening`))