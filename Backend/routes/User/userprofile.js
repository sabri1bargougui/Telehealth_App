const { json } = require('body-parser');
const express = require('express');
const { User } = require('../../db/Models/user.model');
const router = express.Router();
const authenticate = require('../controller/authenticate');


/// *** get user profile ***//

router.get('/', authenticate, (req, res) => {

    User.findById({
        _id: req.user_id
    }).then((profile) => {
        res.json({
            'data': profile
        });
    }).catch((e) => {
        res.send(e);
    });

});


// *** update user profile ** /// 

router.patch('/', authenticate, (req, res) => {
    condition = { _id: req.user_id };
    User.updateOne(condition, req.body).then(doc => {
        if (!doc) {
            return res.status(400).json({
                'error': 'please try again',
            })
        }
        return res.status(200).json(doc);
    })
        .catch(err => next(err));
});
module.exports = router;