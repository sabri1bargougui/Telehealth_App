//***  handle connection to database */

const mongoose = require('mongoose');
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost:27017/telemedicine', { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {

    console.log('connected to mongodb server  successefully');
}).catch((e) => {
    console.log('error while connecting to mongodb server');
});

// ** description warning ** //

mongoose.set('useCreateIndex', true);
mongoose.set('useFindAndModify', false);

module.exports = { mongoose };