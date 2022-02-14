const mongoose = require('mongoose');
const DoctorSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        required: true,
        trim: true
    },

    age: {
        type: Number,
        required: true,
        trim: true
    },
    specialization: {
        type: String,
        required: true,
        trim: true
    },


})

const Doctor = mongoose.model('Doctor', DoctorSchema);

module.exports = { Doctor };