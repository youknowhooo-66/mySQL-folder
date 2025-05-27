import express from 'express'
import conexao from '../infra/conexao.js'

const app = express()

app.use(express.json())

app.get('/estudantesY', (req, res) =>{
    const sql = 'SELECT * FROM dados_estudantes'
    conexao.query(sql,(erro, resultado) =>{
        if(erro){
            console.log(erro)
        } else {
            res.json(resultado)
        }
    })
})

export default app;