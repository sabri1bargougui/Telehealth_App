const mongoose = require('mongoose');
const AnalysSchema = mongoose.Schema({
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

    numdemande: {
        type: Number,
        required: true,
        trim: true
    },
    numdOrder: {
        type: Number,
        required: true,
        trim: true
    },
    dateprelv: {
        type: String,
        required: true,
        trim: true
    },
    datenais: {
        type: String,
        required: true,
        trim: true
    },
    valone: {
        type: Number,
        required: true,
        trim: true
    },
    valtwo: {
        type: Number,
        required: true,
        trim: true
    },
    analysnameone: {
        type: String,
        required: true,
        trim: true
    },

    analysnametwo: {
        type: String,
        required: true,
        trim: true
    },

    valuselone: {
        type: Number,
        required: true,
        trim: true
    },
    valuseltwo: {
        type: Number,
        required: true,
        trim: true
    },
    indexnum: {
        type: Number,
        required: true,
        trim: true
    },
    analysname: {
        type: String,
        required: true,
        trim: true
    },
    // with auth
    _userId: {
        type: mongoose.Types.ObjectId,
        required: true
    }





})

const Analys = mongoose.model('Analys', AnalysSchema);

module.exports = { Analys };