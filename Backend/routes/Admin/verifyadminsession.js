const express = require('express');
const router = express.Router();
const { Admin } = require('../../db/Models/admin.model');
let verifySession = (req, res, next) => {
    let refreshToken = req.header('x-refresh-token');
    let _id = req.header('_id');

    Admin.findByIdAndToken(_id, refreshToken).then((admin) => {
        if (!admin) {
            // user couldn't be found
            return Promise.reject({
                'error': 'User not found. Make sure that the refresh token and user id are correct'
            });
        }




        req.admin_id = admin._id;
        req.adminObject = admin;
        req.refreshToken = refreshToken;

        let isSessionValid = false;

        admin.sessions.forEach((session) => {
            if (session.token === refreshToken) {
                // check if the session has expired
                if (Admin.hasRefreshTokenExpired(session.expiresAt) === false) {
                    // refresh token has not expired
                    isSessionValid = true;
                }
            }
        });

        if (isSessionValid) {
            // the session is VALID - call next() to continue with processing this web request
            next();
        } else {
            // the session is not valid
            return Promise.reject({
                'error': 'Refresh token has expired or the session is invalid'
            })
        }

    }).catch((e) => {
        res.status(401).send(e);
    })
};

router.get('/', verifySession, (req, res) => {
    // we know that the user/caller is authenticated and we have the user_id and user object available to us
    req.adminObject.generateAccessAuthToken().then((accessToken) => {
        res.header('x-access-token', accessToken).send({ accessToken });
    }).catch((e) => {
        res.status(400).send(e);
    });
});
module.exports = router;
