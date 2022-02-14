const express = require('express');
const { Admin } = require('../../db/Models/admin.model');
const router = express.Router();
const bcrypt = require('bcryptjs');



/// *** signup user *** //// 
router.post('/', async (req, res) => {

    const EmailExist = await Admin.findOne({ email: req.body.email });
    if (EmailExist) return res.status(400).send('email already exist!');

    let body = req.body;
    let newAdmin = new Admin(body);

    newAdmin.save().then(() => {
        return newAdmin.createSession();
    }).then((refreshToken) => {
        // Session created successfully - refreshToken returned.
        // now we geneate an access auth token for the user
        return newAdmin.generateAccessAuthToken().then((accessToken) => {
            // access auth token generated successfully, now we return an object containing the auth tokens
            return { accessToken, refreshToken }
        });
    }).then((authTokens) => {
        // Now we construct and send the response to the user with their auth tokens in the header and the user object in the body
        res
            .header('x-refresh-token', authTokens.refreshToken)
            .header('x-access-token', authTokens.accessToken)
            .send(newAdmin);
    }).catch((e) => {
        res.send(e);
    })
});

module.exports = router;