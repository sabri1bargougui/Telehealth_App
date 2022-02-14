const express = require('express');
const { Appoitment } = require('../../../db/Models/appoitment.model');
const router = express.Router();
const authenticate = require('../../controller/authenticateadmin');


/// *** get users profile ***//

router.get('/', authenticate, (req, res) => {
    /*  Appoitment.where(isaccepted = 'En attendant').find({}).then((appointment) => {
          res.send(appointment);
      }).catch((e) => {
          res.send(e);
      });*/
    /* Appoitment.find({}).select(isaccepted = 'En attendant').then((appointment) => {
         res.send(appoitment);
     }).catch((e) => {
         res.send(e);
     });*/

    Appoitment.find({ isaccepted: 'En attendant' }).then((appoitment) => {
        res.send(appoitment);
    }).catch((e) => {
        res.send(e);
    });

});

/// *** delete user ***//
router.delete('/:id', authenticate, (req, res) => {
    Appoitment.findOneAndRemove({
        _id: req.params.id,
    }).then((removeuserdoc) => {
        res.send(removeuserdoc);
    })


});
module.exports = router;