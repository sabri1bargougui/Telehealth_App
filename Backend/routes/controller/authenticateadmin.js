const { Admin } = require('../../db/Models/admin.model');
const jwt = require('jsonwebtoken');

// check whether the request has a valid JWT access token
module.exports = authenticate = (req, res, next) => {
    let token = req.header('x-access-token');

    // verify the JWT
    jwt.verify(token, Admin.getJWTSecret(), (err, decoded) => {
        if (err) {
            // there was an error
            // jwt is invalid - * DO NOT AUTHENTICATE *
            res.status(401).send(err);
        } else {
            // jwt is valid
            req.admin_id = decoded._id;
            next();
        }
    });
}

