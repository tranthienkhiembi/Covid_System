const express = require('express'),
    router = express.Router(),
    userModel = require('../models/home.M'),
    bcrypt = require('bcrypt'),
    passport = require('passport'),
    saltRounds = parseInt(process.env.SALT_ROUND);

router.get('/', (req, res) => {
    res.redirect('/signin');
});

router.get('/signin', async (req, res) => {

    if (req.user) return res.redirect(req.session.pathCur);

    const size = await userModel.countAccount();
    if (parseInt(size[0].Size) === 0) return res.redirect('/register');

    res.render('signin/signin', {
        layout: false,
    });
});

router.post('/signin', async (req, res, next) => {
    passport.authenticate('local', function (err, user, info) {   

        if (!user && info && info.message === 'Missing credentials')
            return res.render('signin/signin', {
                layout: false,
                message: 'Enter complete information!',
                errorSystem: true,
            });
        if (err)
            return res.render('signin/signin', {
                layout: false,
                message: 'Account does not exist!',
                errorSystem: true,
            });

        if (info) {
            //Account locked
            if (info.err === 0)
                return res.render('signin/signin', {
                    layout: false,
                    message: info.message,
                    errorSystem: true,
                });

            //Error username
            if (info.err === 1)
                return res.render('signin/signin', {
                    layout: false,
                    message: info.message,
                    errorUser: true,
                });

            return res.render('signin/signin', {
                layout: false,
                message: info.message,
                errorPass: true,
            });
        }

        req.logIn(user, async function (err) {
            if (err) {

                return res.render('signin/signin', {
                    layout: false,
                    message: 'Account does not exist!',
                    errorSystem: true,
                });
            }
            delete user.Password;

            //User: Role = 1
            if (parseInt(user.Role) === 1) {
                if (parseInt(user.FirstActive) === 0)
                    return res.redirect(`/changePass?user=${user.Username}`);

                return res.redirect('/user');
            }

            //Admin: Role = 2
            if (parseInt(user.Role) === 2) return res.redirect('/admin');

            const today = new Date();
            const date =
                today.getFullYear() +
                '-' +
                (today.getMonth() + 1) +
                '-' +
                today.getDate();
            const time =
                today.getHours() +
                ':' +
                today.getMinutes() +
                ':' +
                today.getSeconds();
            const dateTime = date + ' ' + time;
            req.session.startTime = dateTime; 
            req.session.activities = []; 


            if (parseInt(user.FirstActive) === 0)
                return res.redirect(`/createSecurity?user=${user.Username}`);
            return res.redirect('/manager');
        });
    })(req, res, next);
});

router.get('/register', async (req, res) => {
    if (req.user) return res.redirect(req.session.pathCur);

    req.session.pathCur = '/register';
    res.render('signin/signin', {
        layout: false,
        firstSignin: true,
    });
});

router.post('/register', async (req, res) => {
    const username = req.body.username;
    const pwd = req.body.password;
    const verifyPass = req.body.verifyPass;
    
    //Check account name length
    if (username.length < 3 || username.length > 16)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Account name with word length [3, 16]',
            errorUser: true,
        });

    //Check account name
    const regexp = /^[a-z]([0-9a-z_\s])+$/i;
    if (!regexp.test(username))
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Account name starts with a letter, including [a-z], [0-9]',
            errorUser: true,
        });

    //Check pass length
    if (pwd.length < 5 || pwd.length > 16)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Passwords are word length [5, 16]',
            errorPass: true,
        });
    
    // VerifyPass
    if (verifyPass != pwd)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Password incorrect',
            errorVerifyPass: true,
        });


    const pwdHashed = await bcrypt.hash(pwd, saltRounds);
    const securityQuesHashed = await bcrypt.hash(
        req.body.securityQuestion,
        saltRounds
    );
    const securityAnswerHashed = await bcrypt.hash(
        req.body.securityAnswer,
        saltRounds
    );
    let account = {
        Username: username,
        Password: pwdHashed,
        Role: 2, //Admin
        LockUp: 0,
        SecurityQuestion: securityQuesHashed,
        SecurityAnswer: securityAnswerHashed,
    };
    const add = await userModel.add(account);

    return res.redirect('/admin');
});

router.get('/changePass', async (req, res) => {
    if (!req.user || req.user.Role != 1 || req.user.FirstActive != 0)
        return res.redirect('/');

    req.session.pathCur = `/changePass?user=${req.query.user}`;

    res.render('signin/changePass', {
        layout: false,
        User: req.query.user,
    });
});

router.post('/changePass', async (req, res) => {
    if (!req.body.password || !req.body.VerifyPass || !req.body.passOld)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            message: 'Enter complete information!',
        });

    const user = await userModel.get(req.query.user);

    const challengeResultPassOld = await bcrypt.compare(
        req.body.passOld,
        user.Password
    );

    if (!challengeResultPassOld)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            errorPassOld: true,
            message: 'Old password does not match!',
        });

    const challengeResult = await bcrypt.compare(
        req.body.password,
        user.Password
    );


    if (challengeResult)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            errorPassNew: true,
            message: 'The password is the same as the old password!',
        });


    if (req.body.password.length < 5 || req.body.password.length > 16)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            errorPassNew: true,
            message: 'The length of the pass in the segment [5, 16]!',
        });


    if (req.body.VerifyPass != req.body.password) {
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            errorVerifyPass: true,
            message: 'New password does not match!',
        });
    }


    const pwdHashed = await bcrypt.hash(req.body.password, saltRounds);
    let account = {
        Username: req.query.user,
        Password: pwdHashed,
        FirstActive: 1,
    };

    const rs = await userModel.patchPassAndActive(account);
    res.redirect(`/createSecurity?user=${req.query.user}`);
});

router.get('/forgotPass', async (req, res) => {
    res.render('signin/forgotPass', {
        layout: false,
    });
});

router.post('/forgotPass', async (req, res) => {


    const user = await userModel.get(req.body.username);
    if (!user)
        return res.render('signin/forgotPass', {
            layout: false,
            errorUser: true,
            error: true,
            message: 'Account name does not exist!',
        });

    //Secure question
    const challengeQuestion = await bcrypt.compare(
        req.body.securityQuestion,
        user.SecurityQuestion
    );
    if (!challengeQuestion)
        return res.render('signin/forgotPass', {
            layout: false,
            error: true,
            errorQuestion: true,
            message: 'Wrong security question!',
        });

    //Check ans
    const challengeAnswer = await bcrypt.compare(
        req.body.securityAnswer,
        user.SecurityAnswer
    );
    if (!challengeAnswer)
        return res.render('signin/forgotPass', {
            layout: false,
            error: true,
            errorAnswer: true,
            message: 'Wrong answer!',
        });

    //Check pass
    if (req.body.passNew.length < 5 || req.body.passNew.length > 16)
        return res.render('signin/forgotPass', {
            layout: false,
            error: true,
            errorPassNew: true,
            message: 'The length of the pass in the segment [5, 16]!',
        });

    //pass don't match
    if (req.body.VerifyPass !== req.body.passNew) {
        return res.render('signin/forgotPass', {
            layout: false,
            error: true,
            errorVerifyPass: true,
            message: 'New password does not match!',
        });
    }

    const pwdHashed = await bcrypt.hash(req.body.passNew, saltRounds);
    let account = {
        Username: req.body.username,
        Password: pwdHashed,
        FirstActive: 1,
    };

    const rs = await userModel.patchPassAndActive(account);
    res.redirect('/');
});

router.get('/createSecurity', async (req, res) => {
    if (!req.user)
        return res.redirect('/');
    req.session.pathCur = `/createSecurity?user=${req.query.user}`;

    res.render('signin/createSecurity', {
        layout: false,
        User: req.query.user,
    });
});

router.post('/createSecurity', async (req, res) => {


    const securityQuesHashed = await bcrypt.hash(
        req.body.securityQuestion,
        saltRounds
    );
    const securityAnswerHashed = await bcrypt.hash(
        req.body.securityAnswer,
        saltRounds
    );
    let account = {
        Username: req.query.user,
        SecurityQuestion: securityQuesHashed,
        SecurityAnswer: securityAnswerHashed,
        FirstActive: 1,
    };
    const rs = await userModel.patchQues_Ans_Active(account);
    const user = await userModel.get(req.query.user);
    //User: Role = 1
    if (parseInt(user.Role) === 1) return res.redirect('/user');

    //Manager: Role = 3
    res.redirect('/manager');
});
module.exports = router;
