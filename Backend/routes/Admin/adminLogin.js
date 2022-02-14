const express = require('express');
const { Admin } = require('../../db/Models/admin.model');
const router = express.Router();

/// *** Login admin *** //// 
router.post('/', async (req, res) => {

    let email = req.body.email;
    let password = req.body.password;

    Admin.findByCredentials(email, password).then((admin) => {
        return admin.createSession().then((refreshToken) => {
            // Session created successfully - refreshToken returned.
            // now we geneate an access auth token for the user

            return admin.generateAccessAuthToken().then((accessToken) => {
                // access auth token generated successfully, now we return an object containing the auth tokens
                return { accessToken, refreshToken }
            });
        }).then((authTokens) => {
            // Now we construct and send the response to the user with their auth tokens in the header and the user object in the body
            res
                .header('x-refresh-token', authTokens.refreshToken)
                .header('x-access-token', authTokens.accessToken)
                .send(authTokens.accessToken);
        })
    }).catch((e) => {
        res.status(400).json({
            error: 'check your email or password !'
        });
    });


});

module.exports = router;
