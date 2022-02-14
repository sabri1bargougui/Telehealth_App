const express = require('express');
const multer = require('multer');
const router = express.Router();
const File = require('../../db/Models/image.model');
const authenticate = require('../controller/authenticate');

// **** multer config ***  ///
const filterfile = (req, file, cb) => {
    if (file.mimetype == 'image/jpg' || file.mimetype == 'image/png' || file.mimetype == 'image/jpeg') {
        cb(null, true);
    } else {
        cb(null, false);

    }

};
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    }
});

var upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 5
    },
    fileFilter: filterfile,
});
// post image from user ////

router.post('/', authenticate, upload.single('imageupload'), (req, res) => {
    let newfile = new File({
        filename: req.file.path,
        _userId: req.user_id
    });
    newfile.save().then((fileDoc) => {
        // the full list document is returned (incl. id)
        res.send(fileDoc);
    });
});
// *** get  image *** //
router.get('/', authenticate, (req, res) => {

    File.find({
        _userId: req.user_id
    }).then((file) => {
        res.send(file);
    }).catch((e) => {
        res.send(e);
    });
});

// **** update image **///
router.patch('/:id', authenticate, upload.single('imageupload'), (req, res) => {
    File.findOneAndUpdate({ _id: req.params.id, _userId: req.user_id }, {
        $set: req.file.filename
    }).then(() => {
        res.send({ 'message': 'updated successfully' });
    });
});



module.exports = router;