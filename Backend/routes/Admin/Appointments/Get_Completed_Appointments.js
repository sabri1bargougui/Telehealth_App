const express = require('express');
const { Appoitment } = require('../../../db/Models/appoitment.model');
const router = express.Router();
const authenticate = require('../../controller/authenticateadmin');


/// *** get users profile ***//

router.get('/', authenticate, (req, res) => {

    Appoitment.find({ isaccepted: 'Terminé' }).then((appoitment) => {
        res.send(appoitment);
    }).catch((e) => {
        res.send(e);
    });

});


module.exports = router;