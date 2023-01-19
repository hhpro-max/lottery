const { Router } = require('express');
const authRoute = Router();
const jwt = require('jsonwebtoken');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');


authRoute.post('/signin', async (req, res) => {
    try {
        const { userName, password } = req.body;
        let user = await User.findOne({ userName: userName });
        if (!user) {
            user = await User.findOne({ email: userName });
            if (!user) {
                return res.status(400).json({ err: "user is not exist" });
            }
        }
        //logging
        req.log.info(`USER TRYING TO SIGNIN -> \n ${user}`);
        //
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            //logging
            req.log.warn(`WRONG PASS FOR -> \n ${user}`);
            //
            return res.status(400).json({ err: "password is wrong" });
        }
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, user });
        //logging
        req.log.info(`USER SIGNINED IN -> \n ${user}`);
        //
    } catch (e) {
        res.status(500).json({ err: e.message });
        //logging
        req.log.fatal(`ERR IN SINGIN ROUTE -> \n ${e}`);
        console.log(e.message);

        console.log(e);
        //
    }
});

authRoute.post('/signup', async (req, res) => {
    try {
        const { userName, password, email } = req.body;
        let existingUser = await User.findOne({ userName });
        if (existingUser) {
            return res.status(400).json({ err: "userName is duplicated" });
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            email,
            userName,
            password:hashedPassword,
            //cart:[]
        });
        user = await user.save();
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, user });
        //logging
        req.log.info(`NEW USER SIGNED UP -> \n ${user}`);
        //
    } catch (e) {
        res.status(500).json({ err: e.message });
        //logging
        req.log.fatal(`ERR IN SIGNUP ROUTE-> \n ${e}`);
        console.log(e.message);

        console.log(e);
        //
    }
});

authRoute.post('/logout',(req,res)=>{
    try{
        const token = req.header('x-auth-token');
        if(!token){
           return res.status(400).json('you were logged out befor');
        }
        const verified = jwt.verify(token,'passwordKey');
        if(!verified){
            return res.status(400).json('auth failed');
        }
        
        const userId = verified.id 
        //logging
        req.log.info(`USER ${userId} LOGGEDOUT !}`);
        //
        //todo terminate token here
        //jwt.destroy(token); [this is not working]
        verified.id = '';
        res.json({msg:'logged out successfully'});
        

    }catch(e){
        res.status(500).json({ err: e.message });
        //logging
        req.log.fatal(`ERR IN LOGOUT ROUTE !}`);
        console.log(e.message);
        console.log(e);
        //
    }
})

module.exports = authRoute;