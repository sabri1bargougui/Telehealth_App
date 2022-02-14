const express = require('express');
const { Analys } = require('../../db/Models/analys.model');
const { User } = require('../../db/Models/user.model');
const router = express.Router();
const authenticate = require('../controller/authenticateadmin');

// *** add analys  *** //
router.post('/:id', authenticate, (req, res) => {

    User.findById(req.params.id, (err, user) => {

        if (err) throw new Error(err);
        // We create an object containing the data from our analys request
        const newAnalys = new Analys({
            name: req.body.name,
            lastname: req.body.lastname,
            numdemande: req.body.numdemande,
            numdOrder: req.body.numdOrder,
            dateprelv: req.body.dateprelv,
            datenais: req.body.datenais,
            valone: req.body.valone,
            valtwo: req.body.valtwo,
            analysnameone: req.body.analysnameone,
            analysnametwo: req.body.analysnametwo,
            valuselone: req.body.valuselone,
            valuseltwo: req.body.valuseltwo,
            indexnum: req.body.indexnum,
            analysname: req.body.analysname,
            _userId: req.params.id



        });

        // we create our new analys in our database
        Analys.create(newAnalys, (err, analys) => {
            if (err) {
                res.redirect('/');
                throw new Error(err);
            }
            // we save our user with our new data (our new analys).
            analys.save((err) => {
                // return res.redirect(`/users/login/${appoitment.id}`);
                return res.send(newAnalys)
            });
        })
    });

});

// get all analys 

router.get('/', authenticate, (req, res) => {

    Analys.find({}).then((analyss) => {
        res.send(analyss);
    }).catch((e) => {
        res.send(e);
    });

});

/// *** delete analys ***//
router.delete('/:id', authenticate, (req, res) => {
    Analys.findOneAndRemove({
        _id: req.params.id,
    }).then((removeanalysrdoc) => {
        res.send(removeanalysrdoc);
    })


});


module.exports = router;