const express = require('express');
const { User } = require('../../db/Models/user.model');
const router = express.Router();
/// *** loginuser *** //// 
router.post('/', (req, res) => {
    let email = req.body.email;
    let password = req.body.password;

    User.findByCredentials(email, password).then((user) => {
        return user.createSession().then((refreshToken) => {
            // Session created successfully - refreshToken returned.
            // now we geneate an access auth token for the user

            return user.generateAccessAuthToken().then((accessToken) => {
                // access auth token generated successfully, now we return an object containing the auth tokens
                return { accessToken, refreshToken }
            });
        }).then((authTokens) => {

            // Now we construct and send the response to the user with their auth tokens in the header and the user object in the body
            res

                .header('x-refresh-token', authTokens.refreshToken)
                .header('x-access-token', authTokens.accessToken)
                .json({
                    token: authTokens.accessToken

                });

        })
    }).catch(() => {
        res.status(400).json({
            error: 'check your email or password !'
        });
    });
})




module.exports = router;
