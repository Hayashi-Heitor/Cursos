const express = require("express");
 const app = express();
 const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send("Estou usando Express !!!");
})

app.listen(PORT, () =>{
    console.log("Esta rodando na porta : ${PORT}");
})
