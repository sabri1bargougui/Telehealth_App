const { json } = require('body-parser');
const express = require('express');
const { Appoitment } = require('../../../db/Models/appoitment.model');
const router = express.Router();
const authenticate = require('../../controller/authenticateadmin');


// *** update user appointment status  ** /// 

router.patch('/:id', (req, res) => {


    Appoitment.findByIdAndUpdate(req.params.id, { isaccepted: 'Refusée' },
        function (err, docs) {
            if (err) {
                console.log(err)
            }
            else {
                return res.status(200).json(docs);
            }
        });

    /*   Appoitment.findOneAndUpdate(
        
           {
   
               "isaccepted": "Accepté",
           }
       ).then(doc => {
           if (!doc) {
               return res.status(400).json({
                   'error': 'please try again',
               })
           }
           return res.status(200).json(doc);
       })
           .catch(err => next(err)); */
});
module.exports = router;