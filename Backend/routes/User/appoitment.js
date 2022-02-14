const express = require('express');
const { Appoitment } = require('../../db/Models/appoitment.model');
const authenticate = require('../controller/authenticate');
const router = express.Router();

// *** make appoitment post *** //
router.post('/', authenticate, (req, res) => {

    let name = req.body.name;
    let lastname = req.body.lastname;
    let phonenumber = req.body.phonenumber;
    let doctor = req.body.doctor;
    let date = req.body.date;
    let newappoitment = new Appoitment({
        name,
        lastname,
        phonenumber,
        doctor,
        date,
        isaccepted: 'En attendant',
        _userId: req.user_id
    });
    newappoitment.save().then((appoitmentDoc) => {
        // the full list document is returned (incl. id)
        res.send(appoitmentDoc);
    })
});

// *** get  appoitment *** //
router.get('/', authenticate, (req, res) => {
    Appoitment.find({
        _userId: req.user_id
    }).then((appoitments) => {
        res.send(appoitments);
    }).catch((e) => {
        res.send(e);
    });



});

// *** delete  appoitment *** //
router.delete('/:id', authenticate, (req, res) => {
    Appoitment.findOneAndRemove({
        _id: req.params.id,
        _userId: req.user_id
    }).then((removedappoitmentdoc) => {
        res.send(removedappoitmentdoc);
    })


});

module.exports = router;
