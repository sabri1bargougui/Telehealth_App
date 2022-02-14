const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const { mongoose } = require('./db/mongoose');


// CORS HEADERS MIDDLEWARE
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET, POST, HEAD, OPTIONS, PUT, PATCH, DELETE");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, x-access-token, x-refresh-token, _id");

    res.header(
        'Access-Control-Expose-Headers',
        'x-access-token, x-refresh-token'
    );

    next();
});

// *** midlware ** //
app.use(bodyParser.json());
app.set("view engine", "ejs");
app.use('/upload', express.static('uploads'));




//** load routes file user */
const Appoitment = require('./routes/User/appoitment');
const usersignup = require('./routes/User/users-signup');
const userlogin = require('./routes/User/user-login');
const userprofile = require('./routes/User/userprofile');
const uplouadimage = require('./routes/User/uplaoud');
const Analys = require('./routes/User/analysget');
const gettoken = require('./routes/User/verifysession');


// *** admin load routes ** ///
const adminsignup = require('./routes/Admin/adminRegister');
const adminlogin = require('./routes/Admin/adminLogin');
const adminanalys = require('./routes/Admin/analys');
const getusers = require('./routes/Admin/users');
const getadmintoken = require('./routes/Admin/verifyadminsession');
const adddoctor = require('./routes/Admin/addDoctor');
const getappoitment = require('./routes/Admin/Appointments/getappoitment');
const updateappointment = require('./routes/Admin/Appointments/accept_appointment');
const refuseappointment = require('./routes/Admin/Appointments/denied_appointment');
const completeappointment = require('./routes/Admin/Appointments/complete_appointment');
const getcompletedappointments = require('./routes/Admin/Appointments/Get_Completed_Appointments');
const getacceptedappointments = require('./routes/Admin/Appointments/Get_Accepted_Appointments');


// **  user routes ** //
app.use('/users/register', usersignup);
app.use('/users/login', userlogin);
app.use('/user/appoitment', Appoitment);
app.use('/user/profile', userprofile);
app.use('/user/upload', uplouadimage);
app.use('/user/analys', Analys);
app.use('/users/me/access-token', gettoken);



// ** Admin Routes *** ///
app.use('/admin/register', adminsignup);
app.use('/admin/login', adminlogin);
app.use('/admin/analys', adminanalys);
app.use('/admin/users', getusers);
app.use('/admin/doctor', adddoctor);
app.use('/admin/appoitments', getappoitment);
app.use('/admin/appoitments', updateappointment);
app.use('/admin/appoitments/denied', refuseappointment);
app.use('/admin/appoitments/complete', completeappointment);
app.use('/admin/appoitments/completed', getcompletedappointments);
app.use('/admin/appoitments/Accepted', getacceptedappointments);
app.use('/admins/me/access-token', getadmintoken);







app.listen(3000, () => {
    console.log('server is listening on port : 3000');

})