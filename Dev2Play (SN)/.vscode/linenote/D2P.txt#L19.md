const express = require('express');     
const router = express.Router();    
const dbconn = require('../src/db');



router.get('/', (req, res) => {

    res.send('funciona'); 

}); 


module.exports = router;