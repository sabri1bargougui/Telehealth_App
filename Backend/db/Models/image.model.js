const mongoose = require('mongoose');
//var Schema = mongoose.Schema;
//var conn = mongoose.Collection;
var fileSchema = new mongoose.Schema({
    filename: String,
    _userId: {
        type: mongoose.Types.ObjectId,
        required: true
    }
});

var fileModel = mongoose.model('File', fileSchema);
module.exports = fileModel;
