const mongoose = require('mongoose');
const AppoitmentSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    lastname: {
        type: String,
        required: true,
        trim: true
    },

    phonenumber: {
        type: Number,
        required: true,
        trim: true
    },

    date: {
        type: String,
        required: true,
        trim: true
    },

    doctor: {
        type: String,
        required: true,
        trim: true
    },
    isaccepted: {
        type: String,
    },
    // with auth
    _userId: {
        type: mongoose.Types.ObjectId,
        required: true
    }



})

const Appoitment = mongoose.model('Appoitment', AppoitmentSchema);

module.exports = { Appoitment };