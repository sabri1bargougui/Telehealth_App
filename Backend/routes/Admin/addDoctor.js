const express = require('express');
const { Doctor } = require('../../db/Models/doctor.model');
const router = express.Router();
const authenticate = require('../controller/authenticateadmin');

// *** add doctor  *** //
router.post('/', authenticate, (req, res) => {

    const newDoctor = new Doctor({
        name: req.body.name,
        description: req.body.description,
        age: req.body.age,
        specialization: req.body.specialization,
    });

    Doctor.create(newDoctor, (err, doctor) => {
        if (err) {
            res.redirect('/');
            throw new Error(err);
        }
        doctor.save((err) => {
            return res.send(newDoctor)
        });
    });


});

/// *** delete Doctor ***//
router.delete('/:id', authenticate, (req, res) => {
    Doctor.findOneAndRemove({
        _id: req.params.id,
    }).then((removedoctordoc) => {
        res.send(removedoctordoc);
    })


});


/// *** get all doctors ***//

router.get('/', authenticate, (req, res) => {

    Doctor.find({}).then((doctor) => {
        res.send(doctor);
    }).catch((e) => {
        res.send(e);
    });

});


module.exports = router;