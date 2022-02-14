const express = require('express');
const { Analys } = require('../../db/Models/analys.model');
const router = express.Router();
const authenticate = require('../controller/authenticate');

// *** get  user analys *** //
router.get('/', authenticate, (req, res) => {

    Analys.find({
        _userId: req.user_id
    }).then((analys) => {
        res.json(analys);
    }).catch((e) => {
        res.send(e);
    });


});



module.exports = router;