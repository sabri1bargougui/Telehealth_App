const express = require('express');
const { User } = require('../../db/Models/user.model');
const router = express.Router();
const authenticate = require('../controller/authenticateadmin');


/// *** get users profile ***//

router.get('/', authenticate, (req, res) => {

    User.find({}).then((profile) => {
        res.send(profile);
    }).catch((e) => {
        res.send(e);
    });

});
/// *** delete user ***//
router.delete('/:id', authenticate, (req, res) => {
    User.findOneAndRemove({
        _id: req.params.id,
    }).then((removeuserdoc) => {
        res.send(removeuserdoc);
    })


});

module.exports = router;